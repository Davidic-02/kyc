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
      currentStep: (json['currentStep'] as num?)?.toInt() ?? 0,
      completedSteps:
          (json['completedSteps'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      status: json['status'] as String? ?? 'in_progress',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$KycProgressModelToJson(_KycProgressModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'basicInfo': instance.basicInfo,
      'twoFactorAuth': instance.twoFactorAuth,
      'documentVerification': instance.documentVerification,
      'currentStep': instance.currentStep,
      'completedSteps': instance.completedSteps,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
    };
