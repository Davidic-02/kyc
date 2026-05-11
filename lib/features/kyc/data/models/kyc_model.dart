import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kyc/features/kyc/data/list/kyc_steps.dart';

part 'kyc_model.freezed.dart';
part 'kyc_model.g.dart';

// =========================
// ENUM HELPERS (FIXED)
// =========================

KycSteps stepFromInt(int value) => KycSteps.values[value];
int stepToInt(KycSteps step) => step.index;

List<KycSteps> _stepsFromJson(List<dynamic> list) =>
    list.map((e) => KycSteps.values[e as int]).toList();

List<dynamic> _stepsToJson(List<KycSteps> list) =>
    list.map((e) => e.index).toList();

// =========================
// BASIC INFO
// =========================

@freezed
abstract class BasicInfoModel with _$BasicInfoModel {
  const factory BasicInfoModel({
    required String firstName,
    required String lastName,
    required String gender,
    required String dob,
    required String age,
    required String country,
  }) = _BasicInfoModel;

  factory BasicInfoModel.fromJson(Map<String, dynamic> json) =>
      _$BasicInfoModelFromJson(json);
}

// =========================
// 2FA MODEL
// =========================

@freezed
abstract class TwoFactorAuthModel with _$TwoFactorAuthModel {
  const factory TwoFactorAuthModel({
    required String secretKey,
    required String qrData,

    @Default(false) bool isSetupComplete,
    @Default(false) bool isVerified,
    @Default(false) bool isEnabled,

    DateTime? enabledAt,
  }) = _TwoFactorAuthModel;

  factory TwoFactorAuthModel.fromJson(Map<String, dynamic> json) =>
      _$TwoFactorAuthModelFromJson(json);
}

// =========================
// DOCUMENT MODEL
// =========================

@freezed
abstract class DocumentVerificationModel with _$DocumentVerificationModel {
  const factory DocumentVerificationModel({
    required String documentType,
    required String documentNumber,
    required String documentUrl,

    @Default(false) bool isVerified,
  }) = _DocumentVerificationModel;

  factory DocumentVerificationModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentVerificationModelFromJson(json);
}

// =========================
// MAIN KYC MODEL
// =========================

@freezed
abstract class Tier2Model with _$Tier2Model {
  const factory Tier2Model({
    // Step 4 — Selfie
    required String selfieUrl,
    @Default(false) bool selfieReviewed, // set to true by admin/backend
    @Default(false) bool selfieApproved,

    // Step 5 — Location
    required double latitude,
    required double longitude,
    required String detectedCountry,
    @Default(false) bool isVpnSuspected,

    // Step 6 — Proof of address
    required String proofOfAddressDocType,
    required String proofOfAddressFrontUrl,
    required String proofOfAddressBackUrl,
    @Default(false) bool proofReviewed,
    @Default(false) bool proofApproved,

    // Overall
    @Default('pending_review') String status,

    // status values:
    //   'pending_review'   — submitted, awaiting manual check
    //   'approved'         — all checks passed
    //   'rejected'         — failed verification
    //   'needs_resubmit'   — one or more docs need resubmission
    DateTime? submittedAt,
    DateTime? reviewedAt,

    // Future: add Onfido applicantId / AWS jobId here
    // String? onfidoApplicantId,
    // String? rekognitionJobId,
  }) = _Tier2Model;

  factory Tier2Model.fromJson(Map<String, dynamic> json) =>
      _$Tier2ModelFromJson(json);
}

// =========================
// UPDATED KYC PROGRESS MODEL
// Evolves Firestore from flat → tiered
// =========================

@freezed
abstract class KycProgressModel with _$KycProgressModel {
  const factory KycProgressModel({
    required String uid,

    // Tier 1
    BasicInfoModel? basicInfo,
    TwoFactorAuthModel? twoFactorAuth,
    DocumentVerificationModel? documentVerification,

    // Tier 2
    Tier2Model? tier2,

    @JsonKey(fromJson: _stepsFromJson, toJson: _stepsToJson)
    @Default([])
    List<KycSteps> completedSteps,

    @JsonKey(fromJson: stepFromInt, toJson: stepToInt)
    @Default(KycSteps.intro)
    KycSteps currentStep,

    // 'in_progress' | 'tier1_submitted' | 'tier1_verified'
    // | 'tier2_pending_review' | 'tier2_approved' | 'tier2_rejected'
    @Default('in_progress') String status,

    DateTime? createdAt,
    DateTime? tier1CompletedAt,
    DateTime? tier2SubmittedAt,
  }) = _KycProgressModel;

  factory KycProgressModel.fromJson(Map<String, dynamic> json) =>
      _$KycProgressModelFromJson(json);
}
