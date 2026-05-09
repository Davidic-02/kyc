part of 'kyc_bloc.dart';

@freezed
class KycEvent with _$KycEvent {
  // =========================
  // INITIAL LOAD
  // =========================
  const factory KycEvent.loadExistingProgress() = _LoadExistingProgress;

  // =========================
  // FLOW CONTROL
  // =========================
  const factory KycEvent.nextStep() = _NextStep;
  const factory KycEvent.previousStep() = _PreviousStep;
  const factory KycEvent.navigateToStep(KycSteps step) = _NavigateToStep;

  // =========================
  // STEP 1: BASIC INFO
  // =========================
  const factory KycEvent.firstNameChanged(String value) = _FirstNameChanged;
  const factory KycEvent.lastNameChanged(String value) = _LastNameChanged;
  const factory KycEvent.ageChanged(String value) = _AgeChanged;
  const factory KycEvent.genderChanged(String value) = _GenderChanged;
  const factory KycEvent.countryChanged(String value) = _CountryChanged;
  const factory KycEvent.basicInfoSaved() = _BasicInfoSaved;

  // =========================
  // STEP 2A: 2FA SETUP
  // =========================
  const factory KycEvent.twoFactorSetupCompleted({
    required String secretKey,
    required String qrData,
  }) = _TwoFactorSetupCompleted;

  // =========================
  // STEP 2B: 2FA VERIFY
  // =========================
  const factory KycEvent.otpDigitChanged({
    required int index,
    required String digit,
  }) = _OtpDigitChanged;
  const factory KycEvent.twoFactorVerificationRequested() =
      _TwoFactorVerificationRequested;

  // =========================
  // STEP 3: DOCUMENTS
  // =========================
  const factory KycEvent.docTypeChanged(String value) = _DocTypeChanged;
  const factory KycEvent.docNumberChanged(String value) = _DocNumberChanged;
  const factory KycEvent.documentSaved() = _DocumentSaved;

  // =========================
  // TIER 1 FINAL SUBMIT
  // =========================
  const factory KycEvent.submitted() = _Submitted;

  // =========================
  // TIER 2 — OPT-IN / SKIP
  // =========================
  const factory KycEvent.startTier2() = _StartTier2;
  const factory KycEvent.skipTier2() = _SkipTier2;

  // =========================
  // STEP 4: SELFIE CAPTURE
  // Swap selfieUrl for API token when integrating Onfido/Rekognition
  // =========================
  const factory KycEvent.selfieCaptureDone({
    required String selfieUrl, // local file path now; CDN URL in production
  }) = _SelfieCaptureDone;

  // =========================
  // STEP 5: LOCATION VERIFY
  // =========================
  const factory KycEvent.locationCaptured({
    required double latitude,
    required double longitude,
    required String detectedCountry,
    required bool isVpnSuspected, // hook this to a backend check later
  }) = _LocationCaptured;

  // =========================
  // STEP 6: PROOF OF ADDRESS
  // =========================
  const factory KycEvent.proofOfAddressDocTypeChanged(String value) =
      _ProofOfAddressDocTypeChanged;
  const factory KycEvent.proofOfAddressUploaded({required String documentUrl}) =
      _ProofOfAddressUploaded;

  // =========================
  // TIER 2 FINAL SUBMIT
  // =========================
  const factory KycEvent.tier2Submitted() = _Tier2Submitted;
}
