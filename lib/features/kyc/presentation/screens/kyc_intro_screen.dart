import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/features/kyc/bloc/kyc/kyc_bloc.dart';
import 'package:kyc/features/kyc/data/list/kyc_steps.dart';

import 'package:kyc/core/widgets/custom_button.dart';

class KycIntroScreen extends StatefulWidget {
  const KycIntroScreen({super.key});

  @override
  State<KycIntroScreen> createState() => _KycIntroScreenState();
}

class _KycIntroScreenState extends State<KycIntroScreen> {
  @override
  void initState() {
    super.initState();
    context.read<KycBloc>().add(const KycEvent.loadExistingProgress());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<KycBloc, KycState>(
      listenWhen: (prev, curr) => prev.currentStep != curr.currentStep,
      listener: (context, state) {
        switch (state.currentStep) {
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
            break; // already here
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.radiusL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                Text(
                  "Let's get your\naccount set up",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Complete 3 steps to verify your identity',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 48),

                BlocBuilder<KycBloc, KycState>(
                  buildWhen: (prev, curr) =>
                      prev.completedSteps != curr.completedSteps,
                  builder: (context, state) {
                    final done = state.completedSteps;
                    return Column(
                      children: [
                        _StepIndicator(
                          number: 1,
                          title: 'Basic Information',
                          description: 'Name, age, gender and country',
                          isCompleted: done.contains(KycSteps.basicInfo),
                          // Active = it's the NEXT step to do
                          isActive: !done.contains(KycSteps.basicInfo),
                        ),
                        const SizedBox(height: 16),
                        _StepIndicator(
                          number: 2,
                          title: 'Two-Factor Authentication',
                          description: 'Setup and verify authenticator',
                          isCompleted: done.contains(KycSteps.twoFactorVerify),
                          isActive:
                              done.contains(KycSteps.basicInfo) &&
                              !done.contains(KycSteps.twoFactorVerify),
                        ),
                        const SizedBox(height: 16),
                        _StepIndicator(
                          number: 3,
                          title: 'Document Verification',
                          description: 'NIN, passport or driver licence',
                          isCompleted: done.contains(KycSteps.documents),
                          isActive:
                              done.contains(KycSteps.twoFactorVerify) &&
                              !done.contains(KycSteps.documents),
                        ),
                      ],
                    );
                  },
                ),

                const Spacer(),

                // Button dispatches nextStep — BlocListener handles navigation
                Button(
                  'Get Started',
                  onPressed: () =>
                      context.read<KycBloc>().add(const KycEvent.nextStep()),
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
            ),
          ),
        ),
      ),
    );
  }
}

class _StepIndicator extends StatelessWidget {
  final int number;
  final String title;
  final String description;
  final bool isCompleted;
  final bool isActive;

  const _StepIndicator({
    required this.number,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted
                ? AppColors.primary
                : isActive
                ? AppColors.primary.withOpacity(0.15)
                : AppColors.surface,
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
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                description,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
