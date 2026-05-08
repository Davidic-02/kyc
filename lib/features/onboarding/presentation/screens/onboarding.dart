import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/core/widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [AppColors.primary, AppColors.background],
            center: Alignment(0.0, -0.7),
            radius: 1.2,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSizes.xl),

                // HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dlonra',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.textPrimary,
                          ),
                    ),
                    const Icon(Icons.close, color: AppColors.textPrimary),
                  ],
                ),

                const Spacer(),

                // 🔥 LOTTIE PLACEHOLDER (IMPORTANT)
                Center(
                  child: SizedBox(
                    height: 220, // reserved animation space
                    width: 220,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.surface.withOpacity(0.3),
                      ),
                      child: const Center(
                        child: Text(
                          "LOTTIE HERE",
                          style: TextStyle(color: AppColors.textSecondary),
                        ),
                      ),

                      // later you replace ONLY this:
                      // child: Lottie.asset('assets/animations/intro.json'),
                    ),
                  ),
                ),

                const Spacer(),

                // TEXT
                Text(
                  'You own your crypto.',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.textPrimary,
                  ),
                ),

                Text(
                  'Not us.',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: AppSizes.md),

                Text(
                  'A secure, non-custodial wallet where only you control access to your assets.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),

                const Spacer(),

                Button(
                  "Get Started",
                  pill: true,
                  onPressed: () {
                    context.goNamed('/auth');
                  },
                ),

                const SizedBox(height: AppSizes.md),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_outline,
                      size: 14,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(width: AppSizes.sm),
                    Text(
                      '100% non-custodial',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppSizes.md),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
