part of 'kyc_bloc.dart';

enum KycStepStatus { initial, loading, success, failure }

// Mirrors the Firestore `status` field — backend/admin controls this
// The app reads this to decide what the user can access
enum KycStatus {
  inProgress, // still filling steps
  tier1Submitted, // submitted, awaiting admin review
  tier1Verified, // admin approved Tier 1 → full dashboard access
  tier2PendingReview, // Tier 2 submitted, awaiting review
  tier2Approved, // Tier 2 approved → higher limits unlocked
  tier2Rejected, // Tier 2 rejected → user must resubmit
}

@freezed
abstract class KycState with _$KycState {
  const KycState._();

  const factory KycState({
    // ── FLOW ──────────────────────────────────────────────────────────
    @Default(KycSteps.intro) KycSteps currentStep,
    @Default([]) List<KycSteps> completedSteps,

    // Firestore-driven status — backend sets this, app reads it
    @Default(KycStatus.inProgress) KycStatus kycStatus,

    // ── TIER 1 SAVED DATA ─────────────────────────────────────────────
    BasicInfoModel? basicInfo,
    TwoFactorAuthModel? twoFactorAuth,
    DocumentVerificationModel? documentVerification,

    // ── TIER 1 FIELD VALUES (no TextControllers in UI) ────────────────
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

  // ── DERIVED: form validity ────────────────────────────────────────────
  bool get isBasicInfoValid =>
      firstName.trim().isNotEmpty &&
      lastName.trim().isNotEmpty &&
      age.trim().isNotEmpty &&
      gender.isNotEmpty &&
      country.isNotEmpty;

  String get otpCode => otpDigits.join();
  bool get isOtpComplete => otpCode.length == 6 && !otpDigits.contains('');

  bool get isDocumentValid => docNumber.trim().isNotEmpty && docType.isNotEmpty;

  bool get isSelfieValid => selfieUrl.isNotEmpty;
  bool get isLocationValid => latitude != 0.0 && longitude != 0.0;
  bool get isProofOfAddressValid => proofOfAddressUrl.isNotEmpty;

  // ── DERIVED: tier completion ──────────────────────────────────────────
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

  // Dashboard access is NOT based on completedSteps —
  // it's based on the Firestore status set by the backend/admin
  bool get canAccessDashboard =>
      kycStatus == KycStatus.tier1Verified ||
      kycStatus == KycStatus.tier2PendingReview ||
      kycStatus == KycStatus.tier2Approved;

  bool get hasTier2Privileges => kycStatus == KycStatus.tier2Approved;

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
      case KycSteps.tier2Intro:
        return isTier1Complete;
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
    // Tier 2
    if (!completedSteps.contains(KycSteps.selfieCapture))
      return KycSteps.selfieCapture;
    if (!completedSteps.contains(KycSteps.locationVerify))
      return KycSteps.locationVerify;
    if (!completedSteps.contains(KycSteps.proofOfAddress))
      return KycSteps.proofOfAddress;
    return KycSteps.tier2Completed;
  }

  bool get isStepBlocked => !canGoToStep(currentStep);
}
