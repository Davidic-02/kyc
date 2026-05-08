// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhoneAuthModel _$PhoneAuthModelFromJson(Map<String, dynamic> json) =>
    _PhoneAuthModel(
      phoneNumber: json['phoneNumber'] as String,
      verificationId: json['verificationId'] as String,
      otp: json['otp'] as String? ?? '',
      isVerified: json['isVerified'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$PhoneAuthModelToJson(_PhoneAuthModel instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'verificationId': instance.verificationId,
      'otp': instance.otp,
      'isVerified': instance.isVerified,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_OtpModel _$OtpModelFromJson(Map<String, dynamic> json) => _OtpModel(
  code: json['code'] as String,
  sentAt: DateTime.parse(json['sentAt'] as String),
  expiresInSeconds: (json['expiresInSeconds'] as num?)?.toInt() ?? 300,
);

Map<String, dynamic> _$OtpModelToJson(_OtpModel instance) => <String, dynamic>{
  'code': instance.code,
  'sentAt': instance.sentAt.toIso8601String(),
  'expiresInSeconds': instance.expiresInSeconds,
};
