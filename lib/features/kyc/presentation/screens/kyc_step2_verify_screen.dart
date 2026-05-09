import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/features/kyc/bloc/kyc/kyc_bloc.dart';

import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/features/kyc/data/list/kyc_steps.dart';

import 'package:kyc/core/widgets/custom_button.dart';

class KycStep2VerifyScreen extends StatefulWidget {
  const KycStep2VerifyScreen({super.key});

  @override
  State<KycStep2VerifyScreen> createState() => _KycStep2VerifyScreenState();
}

class _KycStep2VerifyScreenState extends State<KycStep2VerifyScreen> {
  late final List<FocusNode> _focusNodes;
  late final List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(6, (_) => FocusNode());
    _controllers = List.generate(6, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (final n in _focusNodes) n.dispose();
    for (final c in _controllers) c.dispose();
    super.dispose();
  }

  String get _code => _controllers.map((c) => c.text).join();

  @override
  Widget build(BuildContext context) {
    return BlocListener<KycBloc, KycState>(
      listenWhen: (prev, curr) => prev.currentStep != curr.currentStep,
      listener: (context, state) {
        if (state.currentStep == KycSteps.documents) {
          context.goNamed('kyc_progress');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.radiusL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),

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
                const Text(
                  'Enter the 6-digit code from your authenticator app',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 24),

                // 6-digit OTP boxes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(6, (i) {
                    return SizedBox(
                      width: 48,
                      height: 56,
                      child: TextField(
                        controller: _controllers[i],
                        focusNode: _focusNodes[i],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: AppColors.surface,
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
                          if (value.isNotEmpty && i < 5) {
                            _focusNodes[i + 1].requestFocus();
                          } else if (value.isEmpty && i > 0) {
                            _focusNodes[i - 1].requestFocus();
                          }
                          setState(() {}); // rebuild to re-evaluate isValid
                        },
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 40),

                BlocBuilder<KycBloc, KycState>(
                  buildWhen: (prev, curr) =>
                      prev.twoFactorVerifyStatus !=
                          curr.twoFactorVerifyStatus ||
                      prev.errorMessage != curr.errorMessage,
                  builder: (context, state) {
                    final isBusy =
                        state.twoFactorVerifyStatus == KycStepStatus.loading;
                    final isValid = _code.length == 6;

                    return Column(
                      children: [
                        Button(
                          isBusy ? 'Verifying...' : 'Verify Code',
                          busy: isBusy,
                          onPressed: isBusy || !isValid
                              ? null
                              : () => context.read<KycBloc>().add(
                                  KycEvent.twoFactorVerificationRequested(
                                    verificationCode: _code,
                                  ),
                                ),
                        ),
                        if (state.errorMessage.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          Text(
                            state.errorMessage,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ],
                    );
                  },
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
