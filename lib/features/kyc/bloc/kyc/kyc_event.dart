part of 'kyc_bloc.dart';

@freezed
class KycEvent with _$KycEvent {
  // =========================
  // INITIAL LOAD
  // =========================
  const factory KycEvent.loadExistingProgress() = _LoadExistingProgress;

  // =========================
  // FLOW CONTROL (NAVIGATION)
  // =========================
  const factory KycEvent.nextStep() = _NextStep;
  const factory KycEvent.previousStep() = _PreviousStep;
  const factory KycEvent.navigateToStep(KycStep step) = _NavigateToStep;

  // =========================
  // STEP 1: BASIC INFO
  // =========================
  const factory KycEvent.basicInfoSaved({
    required String firstName,
    required String lastName,
    required String gender,
    required String age,
    required String country,
  }) = _BasicInfoSaved;

  // =========================
  // STEP 2A: 2FA SETUP
  // =========================
  const factory KycEvent.twoFactorSetupCompleted({
    required String secretKey,
    required String qrData,
  }) = _TwoFactorSetupCompleted;

  // =========================
  // STEP 2B: 2FA VERIFICATION
  // =========================
  const factory KycEvent.twoFactorVerificationRequested({
    required String verificationCode,
  }) = _TwoFactorVerificationRequested;

  // =========================
  // STEP 3: DOCUMENTS
  // =========================
  const factory KycEvent.documentSaved({
    required String documentType,
    required String documentNumber,
    required String documentUrl,
  }) = _DocumentSaved;

  // =========================
  // FINAL SUBMIT
  // =========================
  const factory KycEvent.submitted() = _Submitted;
}
