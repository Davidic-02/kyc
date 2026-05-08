import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_auth_model.freezed.dart';
part 'phone_auth_model.g.dart';

@freezed
abstract class PhoneAuthModel with _$PhoneAuthModel {
  const factory PhoneAuthModel({
    required String phoneNumber,
    required String verificationId,
    @Default('') String otp,
    @Default(false) bool isVerified,
    DateTime? createdAt,
  }) = _PhoneAuthModel;

  factory PhoneAuthModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneAuthModelFromJson(json);
}

@freezed
abstract class OtpModel with _$OtpModel {
  const factory OtpModel({
    required String code,
    required DateTime sentAt,
    @Default(300) int expiresInSeconds, // 5 minutes
  }) = _OtpModel;

  factory OtpModel.fromJson(Map<String, dynamic> json) =>
      _$OtpModelFromJson(json);
}
