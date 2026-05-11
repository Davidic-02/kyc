// lib/features/kyc/presentation/screens/kyc_decision_screen.dart
//
// This screen appears after all 3 Tier 1 steps are saved (Step 3 done).
// It does TWO things:
//   1. Lets the user submit Tier 1 for review (sets status = "tier1_submitted")
//   2. After submission, offers the path to Tier 2 or going home to wait
//
// The dashboard is NOT accessible here — only after backend sets "tier1_verified".

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/core/services/toast_services.dart';
import 'package:kyc/core/widgets/custom_button.dart';
import 'package:kyc/features/kyc/bloc/kyc/kyc_bloc.dart';
import 'package:kyc/features/kyc/data/list/kyc_steps.dart';
import 'package:lottie/lottie.dart';

class KycDecisionScreen extends HookWidget {
  const KycDecisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<KycBloc, KycState>(
      listenWhen: (prev, curr) =>
          prev.submitStatus != curr.submitStatus ||
          prev.currentStep != curr.currentStep ||
          prev.errorMessage != curr.errorMessage,
      listener: (context, state) {
        if (state.errorMessage.isNotEmpty) {
          ToastService.toast(state.errorMessage, ToastType.error);
        }
        // startTier2 sets currentStep = tier2Intro → navigate
        if (state.currentStep == KycSteps.tier2Intro) {
          context.goNamed('kyc_tier2_intro');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<KycBloc, KycState>(
            builder: (context, state) {
              final isSubmitting = state.submitStatus == KycStepStatus.loading;
              final hasSubmitted =
                  state.kycStatus == KycStatus.tier1Submitted ||
                  state.kycStatus == KycStatus.tier1Verified ||
                  state.kycStatus == KycStatus.tier2PendingReview ||
                  state.kycStatus == KycStatus.tier2Approved;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(AppSizes.radiusL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),

                    // ── Icon ─────────────────────────────────────────────
                    Center(
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Lottie.asset(
                          hasSubmitted
                              ? 'assets/animations/Message Sent.json'
                              : 'assets/animations/Message Sent.json',
                          repeat: true,
                          animate: true,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // ── Headline ──────────────────────────────────────────
                    Center(
                      child: Text(
                        hasSubmitted
                            ? 'Application Submitted!'
                            : 'Tier 1 Complete!',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Center(
                      child: Text(
                        hasSubmitted
                            ? 'Our compliance team is reviewing your application.\n'
                                  'This usually takes 1–2 business days.'
                            : 'All 3 steps are done. Submit your application\n'
                                  'to begin review.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // ── Step summary ──────────────────────────────────────
                    _SummaryRow(
                      icon: Icons.person_outline,
                      title: 'Basic Information',
                      isDone: state.completedSteps.contains(KycSteps.basicInfo),
                    ),
                    const SizedBox(height: 12),
                    _SummaryRow(
                      icon: Icons.shield_outlined,
                      title: 'Two-Factor Authentication',
                      isDone: state.completedSteps.contains(
                        KycSteps.twoFactorVerify,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _SummaryRow(
                      icon: Icons.badge_outlined,
                      title: 'Document Verification',
                      isDone: state.completedSteps.contains(KycSteps.documents),
                    ),

                    const SizedBox(height: 40),

                    // ── Status note ───────────────────────────────────────
                    if (hasSubmitted)
                      Container(
                        padding: const EdgeInsets.all(AppSizes.md),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(AppSizes.radiusM),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.info_outline,
                              color: AppColors.primary,
                              size: 18,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'You\'ll receive a notification once your '
                                'account is verified. You can\'t access the '
                                'dashboard until verification is complete.',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(color: AppColors.textSecondary),
                              ),
                            ),
                          ],
                        ),
                      ),

                    const SizedBox(height: 32),

                    // ── Primary action ────────────────────────────────────
                    if (!hasSubmitted)
                      Button(
                        isSubmitting ? 'Submitting...' : 'Submit Application',
                        busy: isSubmitting,
                        onPressed: isSubmitting
                            ? null
                            : () => context.read<KycBloc>().add(
                                const KycEvent.submitted(),
                              ),
                      ),

                    // ── After submission: Upgrade or wait ─────────────────
                    if (hasSubmitted && !state.isTier2Complete) ...[
                      Button(
                        'Upgrade to Tier 2',
                        onPressed: () => context.read<KycBloc>().add(
                          const KycEvent.startTier2(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Button(
                        'Go Home — I\'ll wait',
                        color: AppColors.surface,
                        textColor: AppColors.textPrimary,
                        onPressed: () => context.goNamed('home'),
                      ),
                    ],

                    if (hasSubmitted && state.isTier2Complete) ...[
                      Button(
                        'Go Home',
                        onPressed: () => context.goNamed('home'),
                      ),
                    ],

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
}

class _SummaryRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isDone;

  const _SummaryRow({
    required this.icon,
    required this.title,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(AppSizes.radiusM),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDone
                  ? AppColors.primary
                  : AppColors.textSecondary.withOpacity(0.2),
            ),
            child: Icon(
              isDone ? Icons.check : icon,
              color: Colors.white,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (isDone)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Done',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
