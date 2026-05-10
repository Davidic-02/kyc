// lib/features/kyc/presentation/screens/kyc_tier2_intro_screen.dart
//
// Shown after user taps "Upgrade to Tier 2" on the Decision screen.
// Explains what Tier 2 involves before the user commits.
// User can still back out here.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/core/widgets/custom_button.dart';
import 'package:kyc/features/kyc/bloc/kyc/kyc_bloc.dart';

class KycTier2IntroScreen extends HookWidget {
  const KycTier2IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.radiusL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // ── Back ────────────────────────────────────────────────────
              GestureDetector(
                onTap: () => context.pop(),
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 32),

              // ── Headline ─────────────────────────────────────────────────
              Text(
                'Unlock Higher Limits',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Tier 2 verification takes about 5 minutes and unlocks '
                'higher transaction limits and full trading access.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 36),

              // ── What you'll unlock ────────────────────────────────────────
              _SectionLabel(label: 'What you\'ll unlock'),
              const SizedBox(height: 16),

              _BenefitRow(
                icon: Icons.trending_up,
                title: 'Higher transaction limits',
                subtitle: 'Send and receive larger amounts',
              ),
              const SizedBox(height: 12),
              _BenefitRow(
                icon: Icons.swap_horiz,
                title: 'Full trading access',
                subtitle: 'Access all trading pairs and features',
              ),
              const SizedBox(height: 12),
              _BenefitRow(
                icon: Icons.verified_user_outlined,
                title: 'Verified badge',
                subtitle: 'Trusted status across the platform',
              ),

              const SizedBox(height: 36),

              // ── What's required ───────────────────────────────────────────
              _SectionLabel(label: 'What\'s required (3 steps)'),
              const SizedBox(height: 16),

              _StepPreview(
                number: 4,
                icon: Icons.camera_alt_outlined,
                title: 'Selfie Capture',
                description:
                    'Take a clear photo of your face for identity matching. '
                    'No glasses or hats — good lighting required.',
              ),
              const SizedBox(height: 12),
              _StepPreview(
                number: 5,
                icon: Icons.location_on_outlined,
                title: 'Location Verification',
                description:
                    'We\'ll confirm your current location for regional '
                    'compliance. A one-time GPS check.',
              ),
              const SizedBox(height: 12),
              _StepPreview(
                number: 6,
                icon: Icons.description_outlined,
                title: 'Proof of Address',
                description:
                    'Upload a utility bill, bank statement or rental '
                    'agreement issued within the last 3 months.',
              ),

              const SizedBox(height: 36),

              // ── Review note ───────────────────────────────────────────────
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
                        'After submission, our compliance team will review '
                        'your documents within 1–2 business days. You\'ll be '
                        'notified once approved.',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // ── CTA ───────────────────────────────────────────────────────
              Button(
                'Start Tier 2 Verification',
                onPressed: () => context.goNamed('kyc_selfie'),
              ),

              const SizedBox(height: 12),

              Button(
                'Maybe Later',
                color: AppColors.surface,
                textColor: AppColors.textPrimary,
                onPressed: () {
                  context.read<KycBloc>().add(const KycEvent.skipTier2());
                  context.goNamed('home');
                },
              ),

              const SizedBox(height: AppSizes.radiusL),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Helpers ──────────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
        fontSize: 15,
      ),
    );
  }
}

class _BenefitRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _BenefitRow({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary.withOpacity(0.12),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 14),
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
                subtitle,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StepPreview extends StatelessWidget {
  final int number;
  final IconData icon;
  final String title;
  final String description;

  const _StepPreview({
    required this.number,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(AppSizes.radiusM),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step number badge
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withOpacity(0.15),
              border: Border.all(color: AppColors.primary, width: 1),
            ),
            child: Center(
              child: Text(
                '$number',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, color: AppColors.primary, size: 16),
                    const SizedBox(width: 6),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
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
