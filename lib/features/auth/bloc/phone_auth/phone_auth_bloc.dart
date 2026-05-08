import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/phone_auth_model.dart';
import '../../data/repositories/phone_auth_repository.dart';
import 'package:formz/formz.dart';

part 'phone_auth_event.dart';
part 'phone_auth_state.dart';
part 'phone_auth_bloc.freezed.dart';

class PhoneAuthBloc extends Bloc<PhoneAuthEvent, PhoneAuthState> {
  final PhoneAuthRepository _phoneAuthRepository;
  Timer? _otpTimer;

  PhoneAuthBloc(this._phoneAuthRepository) : super(const PhoneAuthState()) {
    on<_PhoneNumberChanged>(_phoneNumberChanged);
    on<_SendOtp>(_sendOtp);
    on<_OtpChanged>(_otpChanged);
    on<_VerifyOtp>(_verifyOtp);
    on<_ResendOtp>(_resendOtp);
    on<_StartOtpTimer>(_startOtpTimer);
    on<_TickTimer>(_tickTimer);
  }

  void _phoneNumberChanged(
    _PhoneNumberChanged event,
    Emitter<PhoneAuthState> emit,
  ) {
    final phone = PhoneFormz.dirty(event.phoneNumber);

    emit(
      state.copyWith(
        phoneNumber: phone.isValid ? phone : PhoneFormz.pure(event.phoneNumber),
      ),
    );
  }

  void _otpChanged(_OtpChanged event, Emitter<PhoneAuthState> emit) {
    final otp = OtpFormz.dirty(event.otp);

    emit(state.copyWith(otp: otp.isValid ? otp : OtpFormz.pure(event.otp)));
  }

  Future<void> _sendOtp(_SendOtp event, Emitter<PhoneAuthState> emit) async {
    if (!state.isPhoneValid) {
      emit(state.copyWith(errorMessage: 'Please enter a valid phone number'));
      return;
    }

    emit(state.copyWith(sendOtpStatus: FormzSubmissionStatus.inProgress));

    try {
      final verificationId = await _phoneAuthRepository.sendOtp(
        state.phoneNumber.value,
      );

      emit(
        state.copyWith(
          verificationId: verificationId,
          sendOtpStatus: FormzSubmissionStatus.success,
          errorMessage: '',
          successMessage: 'OTP sent successfully',
          otpTimerSeconds: 300,
          canResendOtp: false,
        ),
      );

      add(const PhoneAuthEvent.startOtpTimer());
    } catch (e) {
      emit(
        state.copyWith(
          sendOtpStatus: FormzSubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _verifyOtp(
    _VerifyOtp event,
    Emitter<PhoneAuthState> emit,
  ) async {
    if (!state.isOtpValid) {
      emit(state.copyWith(errorMessage: 'Please enter a valid 6-digit OTP'));
      return;
    }

    emit(state.copyWith(verifyOtpStatus: FormzSubmissionStatus.inProgress));

    try {
      final isVerified = await _phoneAuthRepository.verifyOtp(
        state.verificationId, // reads from state, not from event

        state.otp.value,
      );

      if (isVerified) {
        _otpTimer?.cancel();
        emit(
          state.copyWith(
            verifyOtpStatus: FormzSubmissionStatus.success,
            errorMessage: '',
            successMessage: 'Phone verified successfully',
          ),
        );
      } else {
        emit(
          state.copyWith(
            verifyOtpStatus: FormzSubmissionStatus.failure,
            errorMessage: 'OTP verification failed',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          verifyOtpStatus: FormzSubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _resendOtp(
    _ResendOtp event,
    Emitter<PhoneAuthState> emit,
  ) async {
    if (!state.canResendOtp) {
      emit(
        state.copyWith(
          errorMessage: 'Please wait before requesting a new code',
        ),
      );
      return;
    }

    emit(state.copyWith(sendOtpStatus: FormzSubmissionStatus.inProgress));

    try {
      final verificationId = await _phoneAuthRepository.resendOtp(
        event.phoneNumber,
      );

      emit(
        state.copyWith(
          verificationId: verificationId,
          sendOtpStatus: FormzSubmissionStatus.success,
          otp: const OtpFormz.pure(),
          otpTimerSeconds: 300,
          canResendOtp: false,
          errorMessage: '',
          successMessage: 'OTP resent successfully',
        ),
      );

      add(const PhoneAuthEvent.startOtpTimer());
    } catch (e) {
      emit(
        state.copyWith(
          sendOtpStatus: FormzSubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _startOtpTimer(_StartOtpTimer event, Emitter<PhoneAuthState> emit) {
    _otpTimer?.cancel();
    _otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      add(const PhoneAuthEvent.tickTimer());
    });
  }

  void _tickTimer(_TickTimer event, Emitter<PhoneAuthState> emit) {
    if (state.otpTimerSeconds > 0) {
      emit(state.copyWith(otpTimerSeconds: state.otpTimerSeconds - 1));
    } else {
      _otpTimer?.cancel();
      emit(state.copyWith(canResendOtp: true));
    }
  }

  @override
  Future<void> close() {
    _otpTimer?.cancel();
    return super.close();
  }
}
