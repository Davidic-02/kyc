import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/core/widgets/custom_button.dart';
import 'package:kyc/features/kyc/bloc/kyc/kyc_bloc.dart';
import 'package:kyc/features/kyc/data/list/kyc_steps.dart';

class KycStep2VerifyScreen extends HookWidget {
  const KycStep2VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Focus nodes only — digits live in bloc state
    final focusNodes = useMemoized(() => List.generate(6, (_) => FocusNode()));

    useEffect(
      () => () {
        for (final n in focusNodes) n.dispose();
      },
      const [],
    );

    return BlocListener<KycBloc, KycState>(
      listenWhen: (prev, curr) =>
          prev.currentStep != curr.currentStep ||
          prev.errorMessage != curr.errorMessage,
      listener: (context, state) {
        if (state.currentStep == KycSteps.documents) {
          context.goNamed('kyc_progress');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<KycBloc, KycState>(
            builder: (context, state) {
              final isBusy =
                  state.twoFactorVerifyStatus == KycStepStatus.loading;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(AppSizes.radiusL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    // ── Header ─────────────────────────────────────────
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => context.read<KycBloc>().add(
                            const KycEvent.previousStep(),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Verify 2FA',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(color: AppColors.textPrimary),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // ── Progress ───────────────────────────────────────
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: const LinearProgressIndicator(
                        value: 0.67,
                        minHeight: 4,
                        backgroundColor: AppColors.surface,
                        color: AppColors.primary,
                      ),
                    ),

                    const SizedBox(height: 32),

                    Text(
                      'Enter verification code',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Enter the 6-digit code from your authenticator app',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ── OTP boxes — value driven by bloc state ─────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(6, (i) {
                        return SizedBox(
                          width: 48,
                          height: 56,
                          child: TextField(
                            focusNode: focusNodes[i],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            // Show the digit stored in bloc state
                            controller:
                                TextEditingController(text: state.otpDigits[i])
                                  ..selection = TextSelection.collapsed(
                                    offset: state.otpDigits[i].length,
                                  ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                              counterText: '',
                              filled: true,
                              fillColor: AppColors.surface.withOpacity(0.5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  AppSizes.radiusM,
                                ),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.zero,
                            ),
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            onChanged: (value) {
                              // Dispatch to bloc
                              context.read<KycBloc>().add(
                                KycEvent.otpDigitChanged(
                                  index: i,
                                  digit: value,
                                ),
                              );
                              // Move focus forward/back
                              if (value.isNotEmpty && i < 5) {
                                focusNodes[i + 1].requestFocus();
                              } else if (value.isEmpty && i > 0) {
                                focusNodes[i - 1].requestFocus();
                              }
                            },
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 40),

                    // ── Error ──────────────────────────────────────────
                    if (state.errorMessage.isNotEmpty) ...[
                      Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                      const SizedBox(height: 12),
                    ],

                    // ── Verify button ──────────────────────────────────
                    Button(
                      isBusy ? 'Verifying...' : 'Verify Code',
                      busy: isBusy,
                      onPressed: isBusy || !state.isOtpComplete
                          ? null
                          : () => context.read<KycBloc>().add(
                              const KycEvent.twoFactorVerificationRequested(),
                            ),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
