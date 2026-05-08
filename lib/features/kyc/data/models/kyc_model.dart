import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc_model.freezed.dart';
part 'kyc_model.g.dart';

//=========================
// STEP 1: BASIC INFO
//=========================
@freezed
abstract class BasicInfoModel with _$BasicInfoModel {
  const factory BasicInfoModel({
    required String firstName,
    required String lastName,
    required String gender,
    required String age,
    required String country,
  }) = _BasicInfoModel;

  factory BasicInfoModel.fromJson(Map<String, dynamic> json) =>
      _$BasicInfoModelFromJson(json);
}

//=========================
// STEP 2: 2FA SECURITY
//=========================
@freezed
abstract class TwoFactorAuthModel with _$TwoFactorAuthModel {
  const factory TwoFactorAuthModel({
    required String secretKey,
    required String qrData,

    @Default(false) bool isSetupComplete, // QR scanned / saved
    @Default(false) bool isVerified, // user entered OTP correctly
    @Default(false) bool isEnabled, // fully active

    DateTime? enabledAt,
  }) = _TwoFactorAuthModel;

  factory TwoFactorAuthModel.fromJson(Map<String, dynamic> json) =>
      _$TwoFactorAuthModelFromJson(json);
}

//=========================
// STEP 3: DOCUMENTS
//=========================
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

//=========================
// MAIN KYC PROGRESS
//=========================
@freezed
abstract class KycProgressModel with _$KycProgressModel {
  const factory KycProgressModel({
    required String uid,

    BasicInfoModel? basicInfo,
    TwoFactorAuthModel? twoFactorAuth,
    DocumentVerificationModel? documentVerification,

    @Default(0) int currentStep,
    @Default([]) List<int> completedSteps,

    @Default('in_progress') String status,

    DateTime? createdAt,
    DateTime? completedAt,
  }) = _KycProgressModel;

  factory KycProgressModel.fromJson(Map<String, dynamic> json) =>
      _$KycProgressModelFromJson(json);
}
