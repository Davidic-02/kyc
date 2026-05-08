import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static const TextStyle onboardingTitle = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w900,
    color: AppColors.textPrimary,
    letterSpacing: -1,
    height: 1.1,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
    height: 1.5,
  );
}
