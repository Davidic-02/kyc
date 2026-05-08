import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/core/widgets/custom_button.dart';
import 'package:kyc/features/auth/bloc/phone_auth/phone_auth_bloc.dart';
import 'package:pinput/pinput.dart';

class PhoneOtpScreen extends HookWidget {
  const PhoneOtpScreen({super.key});

  static const String routeName = 'phone_otp';

  @override
  Widget build(BuildContext context) {
    final otpController = useTextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocListener<PhoneAuthBloc, PhoneAuthState>(
        listener: (context, state) {
          if (state.verifyOtpStatus.isSuccess) {
            context.go('/home');
          } else if (state.verifyOtpStatus.isFailure &&
              state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.radiusL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                Text(
                  "Verify number",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 8),

                // phoneNumber comes from bloc, not route args
                BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
                  buildWhen: (prev, curr) =>
                      prev.phoneNumber != curr.phoneNumber,

                  builder: (context, state) => Text(
                    "Code sent to ${state.phoneNumber}",

                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
                ),

                const SizedBox(height: 40),

                BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
                  buildWhen: (prev, curr) => prev.otp != curr.otp,
                  builder: (context, state) {
                    final pinTheme = PinTheme(
                      width: 52,
                      height: 52,
                      textStyle: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(AppSizes.radiusM),
                      ),
                    );
                    return Pinput(
                      length: 6,
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      defaultPinTheme: pinTheme,
                      onChanged: (value) => context.read<PhoneAuthBloc>().add(
                        PhoneAuthEvent.otpChanged(value),
                      ),
                    );
                  },
                ),

                const SizedBox(height: AppSizes.radiusL),

                BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
                  buildWhen: (prev, curr) =>
                      prev.verifyOtpStatus != curr.verifyOtpStatus,
                  builder: (context, state) => Button(
                    state.verifyOtpStatus.isInProgress
                        ? "Verifying..."
                        : "Verify",
                    busy: state.verifyOtpStatus.isInProgress,
                    onPressed: state.verifyOtpStatus.isInProgress
                        ? null
                        : () => context.read<PhoneAuthBloc>().add(
                            const PhoneAuthEvent.verifyOtp(),
                          ),
                  ),
                ),

                const Spacer(),

                BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
                  buildWhen: (prev, curr) =>
                      prev.otpTimerSeconds != curr.otpTimerSeconds ||
                      prev.canResendOtp != curr.canResendOtp,
                  builder: (context, state) {
                    final minutes = state.otpTimerSeconds ~/ 60;
                    final seconds = state.otpTimerSeconds % 60;
                    return Center(
                      child: state.canResendOtp
                          ? GestureDetector(
                              // phoneNumber still from bloc, not args
                              onTap: () => context.read<PhoneAuthBloc>().add(
                                PhoneAuthEvent.resendOtp(
                                  state.phoneNumber.value,
                                ),
                              ),
                              child: const Text(
                                "Resend code",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          : Text(
                              'Resend code in ${minutes}m ${seconds}s',
                              style: const TextStyle(
                                color: AppColors.textSecondary,
                              ),
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
