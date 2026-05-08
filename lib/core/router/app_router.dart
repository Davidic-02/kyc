import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:kyc/features/onboarding/presentation/onboarding_screen.dart';
import 'package:kyc/features/auth/presentation/auth_page.dart';
import 'package:kyc/features/auth/presentation/phone_input_screen.dart';
import 'package:kyc/features/auth/presentation/phone_otp_screen.dart';
import 'package:kyc/features/home/presentation/home_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    // ─────────────────────────────────────────────
    // ONBOARDING
    // ─────────────────────────────────────────────
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    // ─────────────────────────────────────────────
    // AUTH SHELL
    // ─────────────────────────────────────────────
    GoRoute(
      path: '/auth',
      name: 'auth',
      builder: (context, state) => const AuthPage(),
      routes: [
        GoRoute(
          path: 'phone_input',
          name: 'phone_input',
          builder: (context, state) => const PhoneInputScreen(),
        ),

        GoRoute(
          path: 'phone_otp',
          name: 'phone_otp',

          // No extra needed — verificationId and phoneNumber

          // are already in PhoneAuthBloc state
          builder: (context, state) => const PhoneOtpScreen(),
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // HOME (after login)
    // ─────────────────────────────────────────────
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
