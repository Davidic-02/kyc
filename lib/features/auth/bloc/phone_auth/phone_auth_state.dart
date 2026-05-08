part of 'phone_auth_bloc.dart';

@freezed
abstract class PhoneAuthState with _$PhoneAuthState {
  const PhoneAuthState._();

  const factory PhoneAuthState({
    @Default(PhoneFormz.pure()) PhoneFormz phoneNumber,
    @Default(OtpFormz.pure()) OtpFormz otp,
    @Default('') String verificationId,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus sendOtpStatus,
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus verifyOtpStatus,
    @Default('') String errorMessage,
    @Default('') String successMessage,
    @Default(300) int otpTimerSeconds,
    @Default(false) bool canResendOtp,
  }) = _PhoneAuthState;

  bool get isPhoneValid => phoneNumber.isValid;
  bool get isOtpValid => otp.isValid;
  bool get isOtpExpired => otpTimerSeconds <= 0;
}

class PhoneFormz extends FormzInput<String, ValidationError> {
  const PhoneFormz.pure([super.value = '']) : super.pure();
  const PhoneFormz.dirty([super.value = '']) : super.dirty();

  @override
  ValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationError.empty;
    }

    // basic phone validation (you can improve later)
    if (value.length < 10) {
      return ValidationError.invalid;
    }

    return null;
  }
}

class OtpFormz extends FormzInput<String, ValidationError> {
  const OtpFormz.pure([super.value = '']) : super.pure();
  const OtpFormz.dirty([super.value = '']) : super.dirty();

  @override
  ValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationError.empty;
    }

    if (value.length != 6) {
      return ValidationError.invalid;
    }

    return null;
  }
}
