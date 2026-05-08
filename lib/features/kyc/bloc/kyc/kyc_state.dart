part of 'kyc_bloc.dart';

//=========================
// STEP STATUS
//=========================
enum KycStepStatus { initial, loading, success, failure }

//=========================
// STATE MACHINE STEPS
//=========================

//=========================
// STATE
//=========================
@freezed
abstract class KycState with _$KycState {
  const KycState._();

  const factory KycState({
    // =========================
    // FLOW CONTROL (BLOC OWNED)
    // =========================
    @Default(KycSteps.intro) KycSteps currentStep,
    @Default([]) List<KycSteps> completedSteps,

    // =========================
    // DATA
    // =========================
    BasicInfoModel? basicInfo,
    TwoFactorAuthModel? twoFactorAuth,
    DocumentVerificationModel? documentVerification,

    // =========================
    // STEP STATUSES
    // =========================
    @Default(KycStepStatus.initial) KycStepStatus basicInfoStatus,
    @Default(KycStepStatus.initial) KycStepStatus twoFactorSetupStatus,
    @Default(KycStepStatus.initial) KycStepStatus twoFactorVerifyStatus,
    @Default(KycStepStatus.initial) KycStepStatus documentStatus,
    @Default(KycStepStatus.initial) KycStepStatus submitStatus,

    // =========================
    // ERROR HANDLING
    // =========================
    @Default('') String errorMessage,
  }) = _KycState;

  // =========================================================
  // CAN USER ACCESS STEP?
  // =========================================================
  bool canGoToStep(KycSteps step) {
    switch (step) {
      case KycSteps.intro:
        return true;

      case KycSteps.basicInfo:
        return true;

      case KycSteps.twoFactorSetup:
        return completedSteps.contains(KycSteps.basicInfo);

      case KycSteps.twoFactorVerify:
        return completedSteps.contains(KycSteps.twoFactorSetup);

      case KycSteps.documents:
        return completedSteps.contains(KycSteps.twoFactorVerify);

      case KycSteps.completed:
        return completedSteps.toSet().containsAll([
          KycSteps.basicInfo,
          KycSteps.twoFactorSetup,
          KycSteps.twoFactorVerify,
          KycSteps.documents,
        ]);
    }
  }

  // =========================================================
  // NEXT STEP LOGIC (DERIVED FROM PROGRESS, NOT TRUSTING UI)
  // =========================================================
  KycSteps getNextStepFromProgress() {
    if (!completedSteps.contains(KycSteps.basicInfo)) {
      return KycSteps.basicInfo;
    }

    if (!completedSteps.contains(KycSteps.twoFactorSetup)) {
      return KycSteps.twoFactorSetup;
    }

    if (!completedSteps.contains(KycSteps.twoFactorVerify)) {
      return KycSteps.twoFactorVerify;
    }

    if (!completedSteps.contains(KycSteps.documents)) {
      return KycSteps.documents;
    }

    return KycSteps.completed;
  }

  // =========================================================
  // READY TO SUBMIT CHECK
  // =========================================================
  bool get isReadyToSubmit {
    return completedSteps.toSet().containsAll([
      KycSteps.basicInfo,
      KycSteps.twoFactorSetup,
      KycSteps.twoFactorVerify,
      KycSteps.documents,
    ]);
  }

  // =========================================================
  // STEP BLOCKING CHECK
  // =========================================================
  bool get isStepBlocked => !canGoToStep(currentStep);
}
