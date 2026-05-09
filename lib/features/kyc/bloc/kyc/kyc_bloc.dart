import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kyc/features/kyc/data/list/kyc_list.dart';
import 'package:kyc/features/kyc/data/list/kyc_steps.dart';
import 'package:kyc/features/kyc/data/models/kyc_model.dart';
import 'package:kyc/features/kyc/data/repository/kyc_repository.dart';

part 'kyc_event.dart';
part 'kyc_state.dart';
part 'kyc_bloc.freezed.dart';

class KycBloc extends Bloc<KycEvent, KycState> {
  final KycRepository _repository;

  String get _uid => '2nufpLkmwyXpBvsI0KHqM1HvRyQ2';

  KycBloc(this._repository) : super(const KycState()) {
    on<_LoadExistingProgress>(_onLoadExistingProgress);
    on<_NavigateToStep>(_onNavigateToStep);
    on<_NextStep>(_onNextStep);
    on<_PreviousStep>(_onPreviousStep);
    on<_BasicInfoSaved>(_onBasicInfoSaved);
    on<_TwoFactorSetupCompleted>(_onTwoFactorSetupCompleted);
    on<_TwoFactorVerificationRequested>(_onTwoFactorVerificationRequested);
    on<_DocumentSaved>(_onDocumentSaved);
    on<_Submitted>(_onSubmitted);
  }

  // ─── Simple TOTP stub — replace with real TOTP lib in prod ───
  bool _verifyTotpCode(String secret, String code) {
    return code.length == 6 && int.tryParse(code) != null;
  }

  Future<void> _onLoadExistingProgress(
    _LoadExistingProgress event,
    Emitter<KycState> emit,
  ) async {
    try {
      final progress = await _repository.getKycProgress(_uid);
      if (progress != null) {
        emit(
          state.copyWith(
            completedSteps: progress.completedSteps,
            basicInfo: progress.basicInfo,
            twoFactorAuth: progress.twoFactorAuth,
            documentVerification: progress.documentVerification,
            // Restore saved step — BlocListener on intro screen
            // will navigate if currentStep changed from intro
            currentStep: progress.currentStep,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> _onNavigateToStep(
    _NavigateToStep event,
    Emitter<KycState> emit,
  ) async {
    final targetStep = event.step;
    final allowed =
        state.canGoToStep(targetStep) ||
        targetStep.index <= state.currentStep.index;

    if (!allowed) {
      emit(state.copyWith(errorMessage: 'Complete previous steps first.'));
      return;
    }
    emit(state.copyWith(currentStep: targetStep, errorMessage: ''));
  }

  Future<void> _onNextStep(_NextStep event, Emitter<KycState> emit) async {
    if (state.currentStep == KycSteps.completed) return;
    final next = state.getNextStepFromProgress();
    emit(state.copyWith(currentStep: next, errorMessage: ''));
  }

  Future<void> _onPreviousStep(
    _PreviousStep event,
    Emitter<KycState> emit,
  ) async {
    final idx = kycFlow.indexOf(state.currentStep);
    if (idx <= 0) return;
    emit(state.copyWith(currentStep: kycFlow[idx - 1], errorMessage: ''));
  }

  Future<void> _onBasicInfoSaved(
    _BasicInfoSaved event,
    Emitter<KycState> emit,
  ) async {
    emit(state.copyWith(basicInfoStatus: KycStepStatus.loading));

    final model = BasicInfoModel(
      firstName: event.firstName,
      lastName: event.lastName,
      gender: event.gender,
      age: event.age,
      country: event.country,
    );

    try {
      await _repository.saveBasicInfo(_uid, model);

      final completed = [...state.completedSteps];
      if (!completed.contains(KycSteps.basicInfo)) {
        completed.add(KycSteps.basicInfo);
      }

      print("STEP SAVED");
      print("Completed steps BEFORE emit: $completed");
      emit(
        state.copyWith(
          basicInfo: model,
          completedSteps: completed,
          basicInfoStatus: KycStepStatus.success,
          // ✅ Advance currentStep — BlocListener fires navigation
          currentStep: KycSteps.twoFactorSetup,
          errorMessage: '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          basicInfoStatus: KycStepStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onTwoFactorSetupCompleted(
    _TwoFactorSetupCompleted event,
    Emitter<KycState> emit,
  ) async {
    emit(state.copyWith(twoFactorSetupStatus: KycStepStatus.loading));

    final model = TwoFactorAuthModel(
      secretKey: event.secretKey,
      qrData: event.qrData,
      isSetupComplete: true,
      isVerified: false,
      isEnabled: false,
    );

    try {
      await _repository.saveTwoFactorAuth(_uid, model);

      final completed = [...state.completedSteps];
      if (!completed.contains(KycSteps.twoFactorSetup)) {
        completed.add(KycSteps.twoFactorSetup);
      }

      emit(
        state.copyWith(
          twoFactorAuth: model,
          completedSteps: completed,
          twoFactorSetupStatus: KycStepStatus.success,
          // ✅ Advance currentStep
          currentStep: KycSteps.twoFactorVerify,
          errorMessage: '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          twoFactorSetupStatus: KycStepStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onTwoFactorVerificationRequested(
    _TwoFactorVerificationRequested event,
    Emitter<KycState> emit,
  ) async {
    emit(state.copyWith(twoFactorVerifyStatus: KycStepStatus.loading));

    final twoFactor = state.twoFactorAuth;

    if (twoFactor == null || !twoFactor.isSetupComplete) {
      emit(
        state.copyWith(
          twoFactorVerifyStatus: KycStepStatus.failure,
          errorMessage: '2FA setup not complete. Go back and set up 2FA first.',
        ),
      );
      return;
    }

    try {
      final isValid = _verifyTotpCode(
        twoFactor.secretKey,
        event.verificationCode,
      );

      if (!isValid) {
        emit(
          state.copyWith(
            twoFactorVerifyStatus: KycStepStatus.failure,
            errorMessage: 'Invalid code. Try again.',
          ),
        );
        return;
      }

      final updated = twoFactor.copyWith(
        isVerified: true,
        isEnabled: true,
        enabledAt: DateTime.now(),
      );

      await _repository.saveTwoFactorAuth(_uid, updated);

      final completed = [...state.completedSteps];
      if (!completed.contains(KycSteps.twoFactorVerify)) {
        completed.add(KycSteps.twoFactorVerify);
      }

      emit(
        state.copyWith(
          twoFactorAuth: updated,
          completedSteps: completed,
          twoFactorVerifyStatus: KycStepStatus.success,
          // ✅ Advance currentStep
          currentStep: KycSteps.documents,
          errorMessage: '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          twoFactorVerifyStatus: KycStepStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onDocumentSaved(
    _DocumentSaved event,
    Emitter<KycState> emit,
  ) async {
    if (!state.completedSteps.contains(KycSteps.twoFactorVerify)) {
      emit(
        state.copyWith(
          documentStatus: KycStepStatus.failure,
          errorMessage: 'Complete 2FA verification before uploading documents.',
        ),
      );
      return;
    }

    emit(state.copyWith(documentStatus: KycStepStatus.loading));

    final model = DocumentVerificationModel(
      documentType: event.documentType,
      documentNumber: event.documentNumber,
      documentUrl: event.documentUrl,
    );

    try {
      await _repository.saveDocumentVerification(_uid, model);

      final completed = [...state.completedSteps];
      if (!completed.contains(KycSteps.documents)) {
        completed.add(KycSteps.documents);
      }

      emit(
        state.copyWith(
          documentVerification: model,
          completedSteps: completed,
          documentStatus: KycStepStatus.success,
          // ✅ Advance currentStep
          currentStep: KycSteps.completed,
          errorMessage: '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          documentStatus: KycStepStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onSubmitted(_Submitted event, Emitter<KycState> emit) async {
    if (!state.isReadyToSubmit) {
      emit(
        state.copyWith(
          submitStatus: KycStepStatus.failure,
          errorMessage: 'Complete all steps before submitting.',
        ),
      );
      return;
    }

    emit(state.copyWith(submitStatus: KycStepStatus.loading));

    try {
      await _repository.submitKyc(_uid);
      emit(
        state.copyWith(submitStatus: KycStepStatus.success, errorMessage: ''),
      );
    } catch (e) {
      emit(
        state.copyWith(
          submitStatus: KycStepStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
