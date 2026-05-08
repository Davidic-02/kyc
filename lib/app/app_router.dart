import 'package:go_router/go_router.dart';
import 'package:kyc/features/auth/presentation/screens/phone_input_screen.dart';
import 'package:kyc/features/auth/presentation/screens/phone_otp_screen.dart';
import 'package:kyc/features/auth_1/presentation/screens/magic_link_screen.dart';
import 'package:kyc/features/onboarding/presentation/screens/onboarding.dart';

final GoRouter router = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/magic_link',
      name: 'magic_link',
      builder: (context, state) => const MagicLinkScreen(),
    ),
    GoRoute(
      path: '/phone_input',
      name: 'phone_input',
      builder: (context, state) => const PhoneInputScreen(),
    ),
    GoRoute(
      path: '/phone_otp',
      name: 'phone_otp',
      builder: (context, state) => const PhoneOtpScreen(),
    ),

    // ─────────────────────────────────────────────
    // KYC — all routes flat, zero constructor args
    // BlocListener on each screen drives navigation
    // ─────────────────────────────────────────────
    GoRoute(
      path: '/kyc',
      name: 'kyc_intro',
      builder: (context, state) => const KycIntroScreen(),
    ),
    GoRoute(
      path: '/kyc/step1',
      name: 'kyc_step1',
      builder: (context, state) => const KycStep1Screen(),
    ),
    GoRoute(
      path: '/kyc/step2_setup',
      name: 'kyc_step2_setup',
      builder: (context, state) => const KycStep2SetupScreen(),
    ),
    GoRoute(
      path: '/kyc/step2_verify',
      name: 'kyc_step2_verify',
      builder: (context, state) => const KycStep2VerifyScreen(),
    ),
    GoRoute(
      path: '/kyc/step3',
      name: 'kyc_step3',
      builder: (context, state) => const KycStep3Screen(),
    ),
    GoRoute(
      path: '/kyc/completion',
      name: 'kyc_completion',
      builder: (context, state) => const KycCompletionScreen(),
    ),
  ],
);
