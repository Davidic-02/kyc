import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/features/kyc/bloc/kyc/kyc_bloc.dart';

import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/features/kyc/data/list/kyc_steps.dart';

import 'package:kyc/core/widgets/custom_button.dart';

class KycCompletionScreen extends StatelessWidget {
  const KycCompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<KycBloc, KycState>(
      listenWhen: (prev, curr) => prev.submitStatus != curr.submitStatus,
      listener: (context, state) {
        if (state.submitStatus == KycStepStatus.success) {
          // Navigate to home after successful submission
          context.goNamed('home');
        } else if (state.submitStatus == KycStepStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.radiusL),
            child: Column(
              children: [
                const Spacer(),

                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary.withOpacity(0.1),
                  ),
                  child: const Icon(
                    Icons.check_circle,
                    size: 60,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(height: 24),

                Text(
                  'KYC Complete!',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Your application is being reviewed',
                  style: TextStyle(color: AppColors.textSecondary),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 48),

                // Step summary — reads completedSteps from bloc
                BlocBuilder<KycBloc, KycState>(
                  buildWhen: (prev, curr) =>
                      prev.completedSteps != curr.completedSteps,
                  builder: (context, state) {
                    final done = state.completedSteps;
                    return Column(
                      children: [
                        _CompletionRow(
                          title: 'Basic Information',
                          isComplete: done.contains(KycSteps.basicInfo),
                        ),
                        const SizedBox(height: 12),
                        _CompletionRow(
                          title: 'Two-Factor Authentication',
                          isComplete: done.contains(KycSteps.twoFactorVerify),
                        ),
                        const SizedBox(height: 12),
                        _CompletionRow(
                          title: 'Document Verification',
                          isComplete: done.contains(KycSteps.documents),
                        ),
                      ],
                    );
                  },
                ),

                const Spacer(),

                BlocBuilder<KycBloc, KycState>(
                  buildWhen: (prev, curr) =>
                      prev.submitStatus != curr.submitStatus,
                  builder: (context, state) {
                    final isBusy = state.submitStatus == KycStepStatus.loading;
                    return Button(
                      isBusy ? 'Submitting...' : 'Submit Application',
                      busy: isBusy,
                      onPressed: isBusy
                          ? null
                          : () => context.read<KycBloc>().add(
                              const KycEvent.submitted(),
                            ),
                    );
                  },
                ),

                const SizedBox(height: AppSizes.radiusL),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CompletionRow extends StatelessWidget {
  final String title;
  final bool isComplete;

  const _CompletionRow({required this.title, required this.isComplete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusM),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isComplete
                  ? AppColors.primary
                  : AppColors.textSecondary.withOpacity(0.3),
            ),
            child: Icon(
              isComplete ? Icons.check : Icons.radio_button_unchecked,
              color: Colors.white,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
