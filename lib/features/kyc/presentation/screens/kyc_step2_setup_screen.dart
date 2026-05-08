import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/features/kyc/bloc/kyc/kyc_bloc.dart';

import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/features/kyc/data/list/kyc_steps.dart';

import 'package:kyc/core/widgets/custom_button.dart';
import 'package:qr_flutter/qr_flutter.dart';

class KycStep2SetupScreen extends StatelessWidget {
  const KycStep2SetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // In production, fetch secret + qrData from your backend.
    // The mock values here match the X/ODOs screenshots.
    final secret =
        context.read<KycBloc>().state.twoFactorAuth?.secretKey ??
        'FRQVIT2VGM4WMZLJJJBXIPRDHRBT6WCQPNTD67KWJFLHIWTWGNKA';
    final qrData =
        'otpauth://totp/ODOs:user@example.com?secret=$secret&issuer=ODOs';

    return BlocListener<KycBloc, KycState>(
      listenWhen: (prev, curr) => prev.currentStep != curr.currentStep,
      listener: (context, state) {
        if (state.currentStep == KycSteps.twoFactorVerify) {
          context.goNamed('kyc_step2_verify');
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
                      'Setup 2FA',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(color: AppColors.textPrimary),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: const LinearProgressIndicator(
                    value: 0.5,
                    minHeight: 4,
                    backgroundColor: AppColors.surface,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(height: 32),

                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppSizes.radiusM),
                    ),
                    child: QrImageView(
                      data: qrData,
                      version: QrVersions.auto,
                      size: 220,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                Text(
                  'Scan with authenticator app',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Use Google Authenticator, Microsoft Authenticator, or Authy',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 24),

                Text(
                  "Can't scan? Enter manually:",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppSizes.radiusM),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          secret,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontFamily: 'Courier',
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: secret));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Copied to clipboard'),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.copy,
                          color: AppColors.textSecondary,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                BlocBuilder<KycBloc, KycState>(
                  buildWhen: (prev, curr) =>
                      prev.twoFactorSetupStatus != curr.twoFactorSetupStatus ||
                      prev.errorMessage != curr.errorMessage,
                  builder: (context, state) {
                    final isBusy =
                        state.twoFactorSetupStatus == KycStepStatus.loading;

                    return Column(
                      children: [
                        Button(
                          isBusy ? 'Setting up...' : 'Continue to Verification',
                          busy: isBusy,
                          onPressed: isBusy
                              ? null
                              : () => context.read<KycBloc>().add(
                                  KycEvent.twoFactorSetupCompleted(
                                    secretKey: secret,
                                    qrData: qrData,
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
