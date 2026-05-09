import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/core/widgets/custom_button.dart';

class OnboardingScreen extends HookWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🧠 animation states
    final showTitle1 = useState(false);
    final showTitle2 = useState(false);
    final showDescription = useState(false);

    // ⏱️ timers
    useEffect(() {
      final t1 = Timer(const Duration(milliseconds: 800), () {
        showTitle1.value = true;
      });

      final t2 = Timer(const Duration(milliseconds: 1000), () {
        showTitle2.value = true;
      });

      final t3 = Timer(const Duration(milliseconds: 1300), () {
        showDescription.value = true;
      });

      return () {
        t1.cancel();
        t2.cancel();
        t3.cancel();
      };
    }, []);

    return Scaffold(
      body: Stack(
        children: [
          // 🔵 BACKGROUND
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [AppColors.primary, AppColors.background],
                center: Alignment(0.0, -0.7),
                radius: 1.2,
              ),
            ),
          ),

          // 🟣 LOTTIE (HIGH + NON-INTERACTIVE)
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.25,
              child: IgnorePointer(
                child: SizedBox(
                  height: 420,
                  child: Lottie.asset(
                    'assets/animations/graph.json',
                    repeat: true,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // 🟢 CONTENT
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSizes.xl),

                  Text(
                    'Stocks',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.lock_outline,
                        size: 11,
                        color: AppColors.textSecondary,
                      ),
                      SizedBox(width: AppSizes.sm),
                      Text(
                        '100% non-custodial',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // 🧠 TEXT BLOCK (NOW LOWER + CLOSE TO BUTTON)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: showTitle1.value ? 1 : 0,
                        child: AnimatedSlide(
                          duration: const Duration(milliseconds: 500),
                          offset: showTitle1.value
                              ? Offset.zero
                              : const Offset(0, 0.2),
                          child: Text(
                            'You own your crypto.',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.textPrimary,
                                ),
                          ),
                        ),
                      ),

                      const SizedBox(height: AppSizes.sm),

                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: showTitle2.value ? 1 : 0,
                        child: AnimatedSlide(
                          duration: const Duration(milliseconds: 500),
                          offset: showTitle2.value
                              ? Offset.zero
                              : const Offset(0, 0.2),
                          child: Text(
                            'Not us.',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.textPrimary,
                                ),
                          ),
                        ),
                      ),

                      const SizedBox(height: AppSizes.sm),

                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: showDescription.value ? 1 : 0,
                        child: AnimatedSlide(
                          duration: const Duration(milliseconds: 500),
                          offset: showDescription.value
                              ? Offset.zero
                              : const Offset(0, 0.2),
                          child: Text(
                            'A secure, non-custodial wallet where only you control access to your assets.',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: AppColors.textSecondary),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSizes.xl),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.go('/magic_link');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: const Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.primary.withOpacity(0.15),
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: AppColors.primary,
                          size: 20,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSizes.md),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
