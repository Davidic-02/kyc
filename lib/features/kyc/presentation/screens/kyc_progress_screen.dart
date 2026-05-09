// kyc_progress_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/features/kyc/bloc/kyc/kyc_bloc.dart';
import 'package:kyc/features/kyc/data/list/kyc_steps.dart';
import 'package:kyc/core/widgets/custom_button.dart';

class KycProgressScreen extends StatelessWidget {
  const KycProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.radiusL),
          child: BlocBuilder<KycBloc, KycState>(
            builder: (context, state) {
              final done = state.completedSteps;
              final nextStep = state.getNextStepFromProgress();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  Text(
                    "Let's Get Your\nAccount Setup",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'In 3 easy steps',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),

                  const SizedBox(height: 48),

                  // Step 1
                  _StepRow(
                    number: 1,
                    title: 'Provide Basic Information',
                    subtitle: 'Let us get to know you',
                    isCompleted: done.contains(KycSteps.basicInfo),
                    isActive: !done.contains(KycSteps.basicInfo),
                  ),

                  _StepConnector(
                    isCompleted: done.contains(KycSteps.basicInfo),
                  ),

                  // Step 2
                  _StepRow(
                    number: 2,
                    title: 'Set Up Two-Factor Authentication',
                    subtitle: 'Add an extra layer of security to your account',
                    isCompleted: done.contains(KycSteps.twoFactorVerify),
                    isActive:
                        done.contains(KycSteps.basicInfo) &&
                        !done.contains(KycSteps.twoFactorVerify),
                  ),

                  _StepConnector(
                    isCompleted: done.contains(KycSteps.twoFactorVerify),
                  ),

                  // Step 3
                  _StepRow(
                    number: 3,
                    title: 'Complete Identity Verification',
                    subtitle:
                        'Verify your identity to unlock access to real trading',
                    isCompleted: done.contains(KycSteps.documents),
                    isActive:
                        done.contains(KycSteps.twoFactorVerify) &&
                        !done.contains(KycSteps.documents),
                  ),

                  const Spacer(),

                  // Dynamic button label based on next step
                  Button(
                    _nextButtonLabel(nextStep),
                    onPressed: () {
                      switch (nextStep) {
                        case KycSteps.basicInfo:
                          context.goNamed('kyc_step1');
                        case KycSteps.twoFactorSetup:
                          context.goNamed('kyc_step2_setup');
                        case KycSteps.twoFactorVerify:
                          context.goNamed('kyc_step2_verify');
                        case KycSteps.documents:
                          context.goNamed('kyc_step3');
                        case KycSteps.completed:
                          context.goNamed('kyc_completion');
                        case KycSteps.intro:
                          break;
                      }
                    },
                  ),

                  const SizedBox(height: 16),

                  Center(
                    child: GestureDetector(
                      onTap: () => context.pop(),
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSizes.radiusL),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  String _nextButtonLabel(KycSteps next) {
    switch (next) {
      case KycSteps.basicInfo:
        return 'Get Started';
      case KycSteps.twoFactorSetup:
        return 'Setup 2FA';
      case KycSteps.twoFactorVerify:
        return 'Verify 2FA';
      case KycSteps.documents:
        return 'Verify Identity';
      case KycSteps.completed:
        return 'Submit Application';
      default:
        return 'Continue';
    }
  }
}

class _StepRow extends StatelessWidget {
  final int number;
  final String title;
  final String subtitle;
  final bool isCompleted;
  final bool isActive;

  const _StepRow({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.isCompleted,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted
                ? AppColors.primary
                : isActive
                ? AppColors.primary.withOpacity(0.15)
                : AppColors.surface,
            border: isActive && !isCompleted
                ? Border.all(color: AppColors.primary, width: 1.5)
                : null,
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, color: Colors.white, size: 20)
                : Text(
                    '$number',
                    style: TextStyle(
                      color: isActive
                          ? AppColors.primary
                          : AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isCompleted || isActive
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                  decoration: isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StepConnector extends StatelessWidget {
  final bool isCompleted;

  const _StepConnector({required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 2,
        height: 32,
        color: isCompleted ? AppColors.primary : AppColors.surface,
      ),
    );
  }
}
