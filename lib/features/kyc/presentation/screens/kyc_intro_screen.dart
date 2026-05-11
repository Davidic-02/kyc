import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/core/widgets/custom_button.dart';
import 'package:kyc/features/kyc/bloc/kyc/kyc_bloc.dart';
import 'package:kyc/features/kyc/data/list/kyc_steps.dart';

class KycIntroScreen extends HookWidget {
  const KycIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<KycBloc>().add(const KycEvent.loadExistingProgress());
      return null;
    }, const []);

    return BlocListener<KycBloc, KycState>(
      listenWhen: (prev, curr) => prev.currentStep != curr.currentStep,
      listener: (context, state) {
        switch (state.currentStep) {
          // ── Tier 1 ─────────────────────────────────────────────────
          case KycSteps.basicInfo:
            context.goNamed('kyc_step1');
          case KycSteps.twoFactorSetup:
            context.goNamed('kyc_step2_setup');
          case KycSteps.twoFactorVerify:
            context.goNamed('kyc_step2_verify');
          case KycSteps.documents:
            context.goNamed('kyc_step3');
          case KycSteps.completed:
            context.goNamed('kyc_decision');

          // ── Tier 2 ─────────────────────────────────────────────────
          case KycSteps.tier2Intro:
            context.goNamed('kyc_tier2_intro');
          case KycSteps.selfieCapture:
            context.goNamed('kyc_selfie');
          case KycSteps.locationVerify:
            context.goNamed('kyc_location');
          case KycSteps.proofOfAddress:
            context.goNamed('kyc_proof_of_address');
          case KycSteps.tier2Completed:
            context.goNamed('kyc_tier2_completion');

          // ── Stay here ───────────────────────────────────────────────
          case KycSteps.intro:
            break; // already on this screen — do nothing
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<KycBloc, KycState>(
            builder: (context, state) {
              final done = state.completedSteps;
              final isTier1Done = state.isTier1Complete;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(AppSizes.radiusL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        height: 180,
                        child: Lottie.asset(
                          'assets/animations/Cybersecurity.json',
                          repeat: true,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 82),

                    Text(
                      "Let's get your account set up",
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      isTier1Done
                          ? 'Tier 1 complete — upgrade to Tier 2 for higher limits'
                          : 'Complete 3 steps to verify your identity',
                      style: const TextStyle(color: AppColors.textSecondary),
                    ),

                    const SizedBox(height: 32),

                    _TierLabel(
                      label: 'Tier 1 — Identity Verification',
                      isComplete: isTier1Done,
                    ),
                    const SizedBox(height: 12),

                    _StepIndicator(
                      number: 1,
                      title: 'Basic Information',
                      description: 'Name, age, gender and country',
                      isCompleted: done.contains(KycSteps.basicInfo),
                      isActive: !done.contains(KycSteps.basicInfo),
                    ),
                    const SizedBox(height: 12),
                    _StepIndicator(
                      number: 2,
                      title: 'Two-Factor Authentication',
                      description: 'Setup and verify authenticator',
                      isCompleted: done.contains(KycSteps.twoFactorVerify),
                      isActive:
                          done.contains(KycSteps.basicInfo) &&
                          !done.contains(KycSteps.twoFactorVerify),
                    ),
                    const SizedBox(height: 12),
                    _StepIndicator(
                      number: 3,
                      title: 'Document Verification',
                      description: 'NIN, passport or driver licence',
                      isCompleted: done.contains(KycSteps.documents),
                      isActive:
                          done.contains(KycSteps.twoFactorVerify) &&
                          !done.contains(KycSteps.documents),
                    ),

                    const SizedBox(height: 28),

                    _TierLabel(
                      label: 'Tier 2 — Enhanced Verification (optional)',
                      isComplete: state.isTier2Complete,
                      isLocked: !isTier1Done,
                    ),
                    const SizedBox(height: 12),

                    const SizedBox(height: 40),

                    Button(
                      _buttonLabel(state),
                      onPressed: () {
                        if (isTier1Done && !state.isTier2Complete) {
                          context.read<KycBloc>().add(
                            const KycEvent.startTier2(),
                          );
                        } else {
                          context.read<KycBloc>().add(
                            const KycEvent.nextStep(),
                          );
                        }
                      },
                    ),

                    const SizedBox(height: 16),

                    if (!isTier1Done)
                      Center(
                        child: GestureDetector(
                          onTap: () => context.pop(),
                          child: const Text(
                            'Skip',
                            style: TextStyle(color: AppColors.textSecondary),
                          ),
                        ),
                      ),

                    if (isTier1Done && !state.isTier2Complete)
                      Center(
                        child: GestureDetector(
                          onTap: () => context.read<KycBloc>().add(
                            const KycEvent.skipTier2(),
                          ),
                          child: const Text(
                            'Skip Tier 2 for now',
                            style: TextStyle(color: AppColors.textSecondary),
                          ),
                        ),
                      ),

                    const SizedBox(height: AppSizes.radiusL),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  String _buttonLabel(KycState state) {
    if (state.isTier2Complete) return 'All Done!';
    if (state.isTier1Complete) return 'Start Tier 2 Verification';
    if (state.completedSteps.isEmpty) return 'Get Started';
    return 'Continue';
  }
}

// ─── Tier label ───────────────────────────────────────────────────────────────
class _TierLabel extends StatelessWidget {
  final String label;
  final bool isComplete;
  final bool isLocked;

  const _TierLabel({
    required this.label,
    required this.isComplete,
    this.isLocked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isComplete
              ? Icons.verified
              : isLocked
              ? Icons.lock_outline
              : Icons.pending_outlined,
          size: 16,
          color: isComplete
              ? AppColors.primary
              : isLocked
              ? AppColors.textSecondary
              : AppColors.primary,
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            color: isLocked ? AppColors.textSecondary : AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

// ─── Step indicator ───────────────────────────────────────────────────────────
class _StepIndicator extends StatelessWidget {
  final int number;
  final String title;
  final String description;
  final bool isCompleted;
  final bool isActive;
  final bool isLocked;

  const _StepIndicator({
    required this.number,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.isActive,
    this.isLocked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isLocked ? 0.4 : 1.0,
      child: Row(
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
              child: isLocked
                  ? const Icon(
                      Icons.lock,
                      color: AppColors.textSecondary,
                      size: 16,
                    )
                  : isCompleted
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
      ),
    );
  }
}
