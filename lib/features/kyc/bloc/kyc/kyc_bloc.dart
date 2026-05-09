import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kyc/features/kyc/data/list/kyc_list.dart';
import 'package:kyc/features/kyc/data/list/kyc_steps.dart';
import 'package:kyc/features/kyc/data/models/kyc_model.dart';
import 'package:kyc/features/kyc/data/repository/kyc_repository.dart';

part 'kyc_event.dart';
part 'kyc_state.dart';
part 'kyc_bloc.freezed.dart';

class KycBloc extends Bloc<KycEvent, KycState> {
  final KycRepository _repository;

  // TODO: swap for FirebaseAuth.instance.currentUser!.uid when auth is live
  String get _uid => '2nufpLkmwyXpBvsI0KHqM1HvRyQ2';

  KycBloc(this._repository) : super(const KycState()) {
    // ── Flow ──────────────────────────────────────────────────────────────
    on<_LoadExistingProgress>(_onLoadExistingProgress);
    on<_NavigateToStep>(_onNavigateToStep);
    on<_NextStep>(_onNextStep);
    on<_PreviousStep>(_onPreviousStep);

    // ── Tier 1 field events ───────────────────────────────────────────────
    on<_FirstNameChanged>(
      (e, emit) => emit(state.copyWith(firstName: e.value, errorMessage: '')),
    );
    on<_LastNameChanged>(
      (e, emit) => emit(state.copyWith(lastName: e.value, errorMessage: '')),
    );
    on<_AgeChanged>(
      (e, emit) => emit(state.copyWith(age: e.value, errorMessage: '')),
    );
    on<_GenderChanged>(
      (e, emit) => emit(state.copyWith(gender: e.value, errorMessage: '')),
    );
    on<_CountryChanged>(
      (e, emit) => emit(state.copyWith(country: e.value, errorMessage: '')),
    );
    on<_BasicInfoSaved>(_onBasicInfoSaved);

    on<_TwoFactorSetupCompleted>(_onTwoFactorSetupCompleted);
    on<_OtpDigitChanged>(_onOtpDigitChanged);
    on<_TwoFactorVerificationRequested>(_onTwoFactorVerificationRequested);

    on<_DocTypeChanged>(
      (e, emit) => emit(state.copyWith(docType: e.value, errorMessage: '')),
    );
    on<_DocNumberChanged>(
      (e, emit) => emit(state.copyWith(docNumber: e.value, errorMessage: '')),
    );
    on<_DocumentSaved>(_onDocumentSaved);
    on<_Submitted>(_onSubmitted);

    // ── Tier 2 events ─────────────────────────────────────────────────────
    on<_StartTier2>(
      (e, emit) => emit(
        state.copyWith(
          activeTier: KycTier.tier2,
          currentStep: KycSteps.selfieCapture,
          errorMessage: '',
        ),
      ),
    );
    on<_SkipTier2>(
      (e, emit) => emit(
        state.copyWith(
          activeTier: KycTier.tier1, // stays on tier 1
          errorMessage: '',
        ),
      ),
    );

    on<_SelfieCaptureDone>(_onSelfieCaptureDone);
    on<_LocationCaptured>(_onLocationCaptured);
    on<_ProofOfAddressDocTypeChanged>(
      (e, emit) => emit(
        state.copyWith(proofOfAddressDocType: e.value, errorMessage: ''),
      ),
    );
    on<_ProofOfAddressUploaded>(_onProofOfAddressUploaded);
    on<_Tier2Submitted>(_onTier2Submitted);
  }

  // ── TOTP stub (swap with real lib in prod) ───────────────────────────────
  bool _verifyTotpCode(String secret, String code) =>
      code.length == 6 && int.tryParse(code) != null;

  // ── OTP digit ────────────────────────────────────────────────────────────
  void _onOtpDigitChanged(_OtpDigitChanged event, Emitter<KycState> emit) {
    final updated = [...state.otpDigits];
    updated[event.index] = event.digit;
    emit(state.copyWith(otpDigits: updated, errorMessage: ''));
  }

  // ── Load progress ─────────────────────────────────────────────────────────
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
            tier2Data: progress.tier2,
            currentStep: progress.currentStep,
            // Pre-fill Tier 1 fields
            firstName: progress.basicInfo?.firstName ?? '',
            lastName: progress.basicInfo?.lastName ?? '',
            age: progress.basicInfo?.age ?? '',
            gender: progress.basicInfo?.gender ?? '',
            country: progress.basicInfo?.country ?? '',
            docType: progress.documentVerification?.documentType ?? 'NIN',
            docNumber: progress.documentVerification?.documentNumber ?? '',
            // Pre-fill Tier 2 fields
            selfieUrl: progress.tier2?.selfieUrl ?? '',
            proofOfAddressDocType:
                progress.tier2?.proofOfAddressDocType ?? 'Utility Bill',
            proofOfAddressUrl: progress.tier2?.proofOfAddressUrl ?? '',
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
    final allowed =
        state.canGoToStep(event.step) ||
        event.step.index <= state.currentStep.index;
    if (!allowed) {
      emit(state.copyWith(errorMessage: 'Complete previous steps first.'));
      return;
    }
    emit(state.copyWith(currentStep: event.step, errorMessage: ''));
  }

  Future<void> _onNextStep(_NextStep event, Emitter<KycState> emit) async {
    if (state.currentStep == KycSteps.tier2Completed) return;
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

  // ── Step 1 ────────────────────────────────────────────────────────────────
  Future<void> _onBasicInfoSaved(
    _BasicInfoSaved event,
    Emitter<KycState> emit,
  ) async {
    if (!state.isBasicInfoValid) {
      emit(state.copyWith(errorMessage: 'Please fill in all fields.'));
      return;
    }
    emit(state.copyWith(basicInfoStatus: KycStepStatus.loading));
    final model = BasicInfoModel(
      firstName: state.firstName.trim(),
      lastName: state.lastName.trim(),
      gender: state.gender,
      age: state.age.trim(),
      country: state.country,
    );
    try {
      await _repository.saveBasicInfo(_uid, model);
      final completed = [...state.completedSteps];
      if (!completed.contains(KycSteps.basicInfo))
        completed.add(KycSteps.basicInfo);
      emit(
        state.copyWith(
          basicInfo: model,
          completedSteps: completed,
          basicInfoStatus: KycStepStatus.success,
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

  // ── Step 2A ───────────────────────────────────────────────────────────────
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
      if (!completed.contains(KycSteps.twoFactorSetup))
        completed.add(KycSteps.twoFactorSetup);
      emit(
        state.copyWith(
          twoFactorAuth: model,
          completedSteps: completed,
          twoFactorSetupStatus: KycStepStatus.success,
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

  // ── Step 2B ───────────────────────────────────────────────────────────────
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
          errorMessage: '2FA setup not complete.',
        ),
      );
      return;
    }
    try {
      if (!_verifyTotpCode(twoFactor.secretKey, state.otpCode)) {
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
      if (!completed.contains(KycSteps.twoFactorVerify))
        completed.add(KycSteps.twoFactorVerify);
      emit(
        state.copyWith(
          twoFactorAuth: updated,
          completedSteps: completed,
          twoFactorVerifyStatus: KycStepStatus.success,
          currentStep: KycSteps.documents,
          otpDigits: ['', '', '', '', '', ''],
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

  // ── Step 3 ────────────────────────────────────────────────────────────────
  Future<void> _onDocumentSaved(
    _DocumentSaved event,
    Emitter<KycState> emit,
  ) async {
    if (!state.isDocumentValid) {
      emit(state.copyWith(errorMessage: 'Please fill in all fields.'));
      return;
    }
    emit(state.copyWith(documentStatus: KycStepStatus.loading));
    final model = DocumentVerificationModel(
      documentType: state.docType,
      documentNumber: state.docNumber.trim(),
      documentUrl: '',
    );
    try {
      await _repository.saveDocumentVerification(_uid, model);
      final completed = [...state.completedSteps];
      if (!completed.contains(KycSteps.documents))
        completed.add(KycSteps.documents);
      emit(
        state.copyWith(
          documentVerification: model,
          completedSteps: completed,
          documentStatus: KycStepStatus.success,
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

  // ── Tier 1 submit ─────────────────────────────────────────────────────────
  Future<void> _onSubmitted(_Submitted event, Emitter<KycState> emit) async {
    if (!state.isReadyToSubmit) {
      emit(
        state.copyWith(errorMessage: 'Complete all steps before submitting.'),
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

  // ── Step 4: Selfie ────────────────────────────────────────────────────────
  Future<void> _onSelfieCaptureDone(
    _SelfieCaptureDone event,
    Emitter<KycState> emit,
  ) async {
    emit(state.copyWith(selfieStatus: KycStepStatus.loading));
    try {
      await _repository.saveSelfie(_uid, event.selfieUrl);
      final completed = [...state.completedSteps];
      if (!completed.contains(KycSteps.selfieCapture))
        completed.add(KycSteps.selfieCapture);
      emit(
        state.copyWith(
          selfieUrl: event.selfieUrl,
          completedSteps: completed,
          selfieStatus: KycStepStatus.success,
          currentStep: KycSteps.locationVerify,
          errorMessage: '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          selfieStatus: KycStepStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  // ── Step 5: Location ──────────────────────────────────────────────────────
  Future<void> _onLocationCaptured(
    _LocationCaptured event,
    Emitter<KycState> emit,
  ) async {
    emit(state.copyWith(locationStatus: KycStepStatus.loading));
    try {
      await _repository.saveLocation(
        _uid,
        lat: event.latitude,
        lng: event.longitude,
        country: event.detectedCountry,
        isVpnSuspected: event.isVpnSuspected,
      );
      final completed = [...state.completedSteps];
      if (!completed.contains(KycSteps.locationVerify))
        completed.add(KycSteps.locationVerify);
      emit(
        state.copyWith(
          latitude: event.latitude,
          longitude: event.longitude,
          detectedCountry: event.detectedCountry,
          isVpnSuspected: event.isVpnSuspected,
          completedSteps: completed,
          locationStatus: KycStepStatus.success,
          currentStep: KycSteps.proofOfAddress,
          errorMessage: '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          locationStatus: KycStepStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  // ── Step 6: Proof of address ──────────────────────────────────────────────
  Future<void> _onProofOfAddressUploaded(
    _ProofOfAddressUploaded event,
    Emitter<KycState> emit,
  ) async {
    emit(state.copyWith(proofOfAddressStatus: KycStepStatus.loading));
    try {
      await _repository.saveProofOfAddress(
        _uid,
        event.documentUrl,
        state.proofOfAddressDocType,
      );
      final completed = [...state.completedSteps];
      if (!completed.contains(KycSteps.proofOfAddress))
        completed.add(KycSteps.proofOfAddress);
      emit(
        state.copyWith(
          proofOfAddressUrl: event.documentUrl,
          completedSteps: completed,
          proofOfAddressStatus: KycStepStatus.success,
          currentStep: KycSteps.tier2Completed,
          errorMessage: '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          proofOfAddressStatus: KycStepStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  // ── Tier 2 submit ─────────────────────────────────────────────────────────
  Future<void> _onTier2Submitted(
    _Tier2Submitted event,
    Emitter<KycState> emit,
  ) async {
    if (!state.isReadyToSubmitTier2) {
      emit(state.copyWith(errorMessage: 'Complete all Tier 2 steps first.'));
      return;
    }
    emit(state.copyWith(tier2SubmitStatus: KycStepStatus.loading));
    try {
      final tier2 = Tier2Model(
        selfieUrl: state.selfieUrl,
        latitude: state.latitude,
        longitude: state.longitude,
        detectedCountry: state.detectedCountry,
        isVpnSuspected: state.isVpnSuspected,
        proofOfAddressDocType: state.proofOfAddressDocType,
        proofOfAddressUrl: state.proofOfAddressUrl,
        submittedAt: DateTime.now(),
      );
      await _repository.submitTier2(_uid, tier2);
      emit(
        state.copyWith(
          tier2Data: tier2,
          tier2SubmitStatus: KycStepStatus.success,
          errorMessage: '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          tier2SubmitStatus: KycStepStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
