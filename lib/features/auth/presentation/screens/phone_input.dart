import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/core/widgets/custom_button.dart';
import 'package:kyc/features/auth/bloc/phone_auth/phone_auth_bloc.dart';

import 'phone_otp_screen.dart';

class PhoneInputScreen extends HookWidget {
  const PhoneInputScreen({super.key});

  static const String routeName = 'phone_input';

  @override
  Widget build(BuildContext context) {
    final phoneController = useTextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocListener<PhoneAuthBloc, PhoneAuthState>(
        listener: (context, state) {
          if (state.sendOtpStatus.isSuccess) {
            Navigator.pushNamed(context, PhoneOtpScreen.routeName);

            // verificationId and phoneNumber live in the bloc —

            // PhoneOtpScreen reads them from there directly
          } else if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
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
                  "Enter phone number",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "We'll send you a verification code",
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 40),
                BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
                  buildWhen: (previous, current) =>
                      previous.phoneNumber != current.phoneNumber ||
                      previous.errorMessage != current.errorMessage,
                  builder: (context, state) {
                    return TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(color: AppColors.textPrimary),
                      onChanged: (value) {
                        context.read<PhoneAuthBloc>().add(
                          PhoneAuthEvent.phoneNumberChanged(value),
                        );
                      },
                      decoration: InputDecoration(
                        hintText: "+234 801 234 5678",
                        hintStyle: const TextStyle(
                          color: AppColors.textSecondary,
                        ),
                        filled: true,
                        fillColor: AppColors.surface,
                        errorText: state.errorMessage.isNotEmpty
                            ? state.errorMessage
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSizes.radiusM),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: AppSizes.radiusL),
                BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
                  buildWhen: (previous, current) =>
                      previous.sendOtpStatus != current.sendOtpStatus,
                  builder: (context, state) {
                    return Button(
                      state.sendOtpStatus.isInProgress
                          ? "Sending..."
                          : "Send Code",
                      busy: state.sendOtpStatus.isInProgress,
                      onPressed: state.sendOtpStatus.isInProgress
                          ? null
                          : () {
                              context.read<PhoneAuthBloc>().add(
                                PhoneAuthEvent.sendOtp(phoneController.text),
                              );
                            },
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
