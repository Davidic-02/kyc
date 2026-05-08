part of 'phone_auth_bloc.dart';

@freezed
class PhoneAuthEvent with _$PhoneAuthEvent {
  const factory PhoneAuthEvent.phoneNumberChanged(String phoneNumber) =
      _PhoneNumberChanged;
  const factory PhoneAuthEvent.sendOtp(String phoneNumber) = _SendOtp;
  const factory PhoneAuthEvent.otpChanged(String otp) = _OtpChanged;
  // verificationId removed — bloc reads it from state internally

  const factory PhoneAuthEvent.verifyOtp() = _VerifyOtp;

  const factory PhoneAuthEvent.resendOtp(String phoneNumber) = _ResendOtp;
  const factory PhoneAuthEvent.startOtpTimer() = _StartOtpTimer;
  const factory PhoneAuthEvent.tickTimer() = _TickTimer;
}
