// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BasicInfoModel _$BasicInfoModelFromJson(Map<String, dynamic> json) =>
    _BasicInfoModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      gender: json['gender'] as String,
      age: json['age'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$BasicInfoModelToJson(_BasicInfoModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'age': instance.age,
      'country': instance.country,
    };

_TwoFactorAuthModel _$TwoFactorAuthModelFromJson(Map<String, dynamic> json) =>
    _TwoFactorAuthModel(
      secretKey: json['secretKey'] as String,
      qrData: json['qrData'] as String,
      isSetupComplete: json['isSetupComplete'] as bool? ?? false,
      isVerified: json['isVerified'] as bool? ?? false,
      isEnabled: json['isEnabled'] as bool? ?? false,
      enabledAt: json['enabledAt'] == null
          ? null
          : DateTime.parse(json['enabledAt'] as String),
    );

Map<String, dynamic> _$TwoFactorAuthModelToJson(_TwoFactorAuthModel instance) =>
    <String, dynamic>{
      'secretKey': instance.secretKey,
      'qrData': instance.qrData,
      'isSetupComplete': instance.isSetupComplete,
      'isVerified': instance.isVerified,
      'isEnabled': instance.isEnabled,
      'enabledAt': instance.enabledAt?.toIso8601String(),
    };

_DocumentVerificationModel _$DocumentVerificationModelFromJson(
  Map<String, dynamic> json,
) => _DocumentVerificationModel(
  documentType: json['documentType'] as String,
  documentNumber: json['documentNumber'] as String,
  documentUrl: json['documentUrl'] as String,
  isVerified: json['isVerified'] as bool? ?? false,
);

Map<String, dynamic> _$DocumentVerificationModelToJson(
  _DocumentVerificationModel instance,
) => <String, dynamic>{
  'documentType': instance.documentType,
  'documentNumber': instance.documentNumber,
  'documentUrl': instance.documentUrl,
  'isVerified': instance.isVerified,
};

_Tier2Model _$Tier2ModelFromJson(Map<String, dynamic> json) => _Tier2Model(
  selfieUrl: json['selfieUrl'] as String,
  selfieReviewed: json['selfieReviewed'] as bool? ?? false,
  selfieApproved: json['selfieApproved'] as bool? ?? false,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  detectedCountry: json['detectedCountry'] as String,
  isVpnSuspected: json['isVpnSuspected'] as bool? ?? false,
  proofOfAddressDocType: json['proofOfAddressDocType'] as String,
  proofOfAddressUrl: json['proofOfAddressUrl'] as String,
  proofReviewed: json['proofReviewed'] as bool? ?? false,
  proofApproved: json['proofApproved'] as bool? ?? false,
  status: json['status'] as String? ?? 'pending_review',
  submittedAt: json['submittedAt'] == null
      ? null
      : DateTime.parse(json['submittedAt'] as String),
  reviewedAt: json['reviewedAt'] == null
      ? null
      : DateTime.parse(json['reviewedAt'] as String),
);

Map<String, dynamic> _$Tier2ModelToJson(_Tier2Model instance) =>
    <String, dynamic>{
      'selfieUrl': instance.selfieUrl,
      'selfieReviewed': instance.selfieReviewed,
      'selfieApproved': instance.selfieApproved,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'detectedCountry': instance.detectedCountry,
      'isVpnSuspected': instance.isVpnSuspected,
      'proofOfAddressDocType': instance.proofOfAddressDocType,
      'proofOfAddressUrl': instance.proofOfAddressUrl,
      'proofReviewed': instance.proofReviewed,
      'proofApproved': instance.proofApproved,
      'status': instance.status,
      'submittedAt': instance.submittedAt?.toIso8601String(),
      'reviewedAt': instance.reviewedAt?.toIso8601String(),
    };

_KycProgressModel _$KycProgressModelFromJson(Map<String, dynamic> json) =>
    _KycProgressModel(
      uid: json['uid'] as String,
      basicInfo: json['basicInfo'] == null
          ? null
          : BasicInfoModel.fromJson(json['basicInfo'] as Map<String, dynamic>),
      twoFactorAuth: json['twoFactorAuth'] == null
          ? null
          : TwoFactorAuthModel.fromJson(
              json['twoFactorAuth'] as Map<String, dynamic>,
            ),
      documentVerification: json['documentVerification'] == null
          ? null
          : DocumentVerificationModel.fromJson(
              json['documentVerification'] as Map<String, dynamic>,
            ),
      tier2: json['tier2'] == null
          ? null
          : Tier2Model.fromJson(json['tier2'] as Map<String, dynamic>),
      completedSteps: json['completedSteps'] == null
          ? const []
          : _stepsFromJson(json['completedSteps'] as List),
      currentStep: json['currentStep'] == null
          ? KycSteps.intro
          : stepFromInt((json['currentStep'] as num).toInt()),
      status: json['status'] as String? ?? 'in_progress',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      tier1CompletedAt: json['tier1CompletedAt'] == null
          ? null
          : DateTime.parse(json['tier1CompletedAt'] as String),
      tier2SubmittedAt: json['tier2SubmittedAt'] == null
          ? null
          : DateTime.parse(json['tier2SubmittedAt'] as String),
    );

Map<String, dynamic> _$KycProgressModelToJson(_KycProgressModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'basicInfo': instance.basicInfo,
      'twoFactorAuth': instance.twoFactorAuth,
      'documentVerification': instance.documentVerification,
      'tier2': instance.tier2,
      'completedSteps': _stepsToJson(instance.completedSteps),
      'currentStep': stepToInt(instance.currentStep),
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'tier1CompletedAt': instance.tier1CompletedAt?.toIso8601String(),
      'tier2SubmittedAt': instance.tier2SubmittedAt?.toIso8601String(),
    };
