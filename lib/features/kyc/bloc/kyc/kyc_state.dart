part of 'kyc_bloc.dart';

enum KycStepStatus { initial, loading, success, failure }

// Which tier the user is currently working on
enum KycTier { tier1, tier2 }

@freezed
abstract class KycState with _$KycState {
  const KycState._();

  const factory KycState({
    // ── FLOW CONTROL ──────────────────────────────────────────────────
    @Default(KycSteps.intro) KycSteps currentStep,
    @Default([]) List<KycSteps> completedSteps,
    @Default(KycTier.tier1) KycTier activeTier,

    // ── TIER 1 SAVED DATA ─────────────────────────────────────────────
    BasicInfoModel? basicInfo,
    TwoFactorAuthModel? twoFactorAuth,
    DocumentVerificationModel? documentVerification,

    // ── TIER 1 FIELD VALUES (bloc owns — no TextControllers in UI) ────
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String age,
    @Default('') String gender,
    @Default('') String country,
    @Default(['', '', '', '', '', '']) List<String> otpDigits,
    @Default('NIN') String docType,
    @Default('') String docNumber,

    // ── TIER 2 SAVED DATA ─────────────────────────────────────────────
    Tier2Model? tier2Data,

    // ── TIER 2 FIELD VALUES ───────────────────────────────────────────
    @Default('') String selfieUrl,
    @Default(0.0) double latitude,
    @Default(0.0) double longitude,
    @Default('') String detectedCountry,
    @Default(false) bool isVpnSuspected,
    @Default('Utility Bill') String proofOfAddressDocType,
    @Default('') String proofOfAddressUrl,

    // ── STEP STATUSES ─────────────────────────────────────────────────
    @Default(KycStepStatus.initial) KycStepStatus basicInfoStatus,
    @Default(KycStepStatus.initial) KycStepStatus twoFactorSetupStatus,
    @Default(KycStepStatus.initial) KycStepStatus twoFactorVerifyStatus,
    @Default(KycStepStatus.initial) KycStepStatus documentStatus,
    @Default(KycStepStatus.initial) KycStepStatus submitStatus,
    @Default(KycStepStatus.initial) KycStepStatus selfieStatus,
    @Default(KycStepStatus.initial) KycStepStatus locationStatus,
    @Default(KycStepStatus.initial) KycStepStatus proofOfAddressStatus,
    @Default(KycStepStatus.initial) KycStepStatus tier2SubmitStatus,

    // ── ERROR ─────────────────────────────────────────────────────────
    @Default('') String errorMessage,
  }) = _KycState;

  // ── DERIVED: Tier 1 validation ────────────────────────────────────────
  bool get isBasicInfoValid =>
      firstName.trim().isNotEmpty &&
      lastName.trim().isNotEmpty &&
      age.trim().isNotEmpty &&
      gender.isNotEmpty &&
      country.isNotEmpty;

  String get otpCode => otpDigits.join();
  bool get isOtpComplete => otpCode.length == 6 && !otpDigits.contains('');

  bool get isDocumentValid => docNumber.trim().isNotEmpty && docType.isNotEmpty;

  // ── DERIVED: Tier 2 validation ────────────────────────────────────────
  bool get isSelfieValid => selfieUrl.isNotEmpty;
  bool get isLocationValid => latitude != 0.0 && longitude != 0.0;
  bool get isProofOfAddressValid => proofOfAddressUrl.isNotEmpty;

  bool get isTier1Complete => completedSteps.toSet().containsAll([
    KycSteps.basicInfo,
    KycSteps.twoFactorSetup,
    KycSteps.twoFactorVerify,
    KycSteps.documents,
  ]);

  bool get isTier2Complete => completedSteps.toSet().containsAll([
    KycSteps.selfieCapture,
    KycSteps.locationVerify,
    KycSteps.proofOfAddress,
  ]);

  bool get isReadyToSubmit => isTier1Complete;
  bool get isReadyToSubmitTier2 => isTier2Complete;

  // ── STEP GATING ───────────────────────────────────────────────────────
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
        return isTier1Complete;
      // Tier 2
      case KycSteps.selfieCapture:
        return isTier1Complete;
      case KycSteps.locationVerify:
        return completedSteps.contains(KycSteps.selfieCapture);
      case KycSteps.proofOfAddress:
        return completedSteps.contains(KycSteps.locationVerify);
      case KycSteps.tier2Completed:
        return isTier2Complete;
    }
  }

  // ── NEXT STEP LOGIC ───────────────────────────────────────────────────
  KycSteps getNextStepFromProgress() {
    if (!completedSteps.contains(KycSteps.basicInfo)) return KycSteps.basicInfo;
    if (!completedSteps.contains(KycSteps.twoFactorSetup))
      return KycSteps.twoFactorSetup;
    if (!completedSteps.contains(KycSteps.twoFactorVerify))
      return KycSteps.twoFactorVerify;
    if (!completedSteps.contains(KycSteps.documents)) return KycSteps.documents;
    if (activeTier == KycTier.tier2) {
      if (!completedSteps.contains(KycSteps.selfieCapture))
        return KycSteps.selfieCapture;
      if (!completedSteps.contains(KycSteps.locationVerify))
        return KycSteps.locationVerify;
      if (!completedSteps.contains(KycSteps.proofOfAddress))
        return KycSteps.proofOfAddress;
      return KycSteps.tier2Completed;
    }
    return KycSteps.completed;
  }

  bool get isStepBlocked => !canGoToStep(currentStep);
}
