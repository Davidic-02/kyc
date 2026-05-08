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
abstract class KycProgressModel with _$KycProgressModel {
  const factory KycProgressModel({
    required String uid,

    BasicInfoModel? basicInfo,
    TwoFactorAuthModel? twoFactorAuth,
    DocumentVerificationModel? documentVerification,

    @JsonKey(fromJson: _stepsFromJson, toJson: _stepsToJson)
    @Default([])
    List<KycSteps> completedSteps,

    @JsonKey(fromJson: stepFromInt, toJson: stepToInt)
    @Default(KycSteps.intro)
    KycSteps currentStep,

    @Default('in_progress') String status,

    DateTime? createdAt,
    DateTime? completedAt,
  }) = _KycProgressModel;

  factory KycProgressModel.fromJson(Map<String, dynamic> json) =>
      _$KycProgressModelFromJson(json);
}
