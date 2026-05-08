import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kyc/core/constants/app_sizes.dart';
import '../constants/app_colors.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final Color textColor;
  final Color disabledTextColor;
  final Color? color;
  final IconData? icon;
  final Color? iconColor;
  final bool busy;
  final bool pill;
  final String? busyText;

  const Button(
    this.text, {
    super.key,
    this.onPressed,
    this.color,
    this.icon,
    this.iconColor,
    this.textColor = AppColors.textPrimary,
    this.disabledTextColor = AppColors.textSecondary,
    this.busy = false,
    this.pill = false,
    this.busyText,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: double.infinity,
        maxWidth: double.infinity,
        minHeight: 52.0,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.pressed)) {
              return AppColors.primary;
            } else if (states.contains(WidgetState.disabled)) {
              return AppColors.surface;
            }
            return color ?? AppColors.primary;
          }),

          padding: WidgetStateProperty.all<EdgeInsets>(
            const EdgeInsets.all(AppSizes.md),
          ),

          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(pill ? 40 : AppSizes.radiusM),
            ),
          ),
        ),

        onPressed: onPressed,

        child: busy
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator.adaptive(
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.textPrimary,
                      ),
                      backgroundColor: Platform.isIOS
                          ? AppColors.textPrimary
                          : null,
                    ),
                  ),
                  if (busyText != null)
                    Text(
                      "     $busyText",
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                      ),
                    ),
                ],
              )
            : (icon == null
                  ? Text(
                      text ?? '',
                      style: TextStyle(
                        color: onPressed == null
                            ? disabledTextColor
                            : textColor,
                        fontSize: 16,
                      ),
                    )
                  : Icon(icon, color: iconColor ?? AppColors.textPrimary)),
      ),
    );
  }
}
