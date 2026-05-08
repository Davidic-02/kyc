import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/core/constants/app_sizes.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.controller,
    required this.focusNode,
    required this.hintText,
    required this.keyboardType,
    this.customFilled,
    this.title,
    super.key,
    this.obscureText = false,
    this.isPassword = false,
    this.isFilled = true,
    this.readOnly = false,
    this.validator,
    this.textInputAction,
    this.onSuffixIconPressed,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.maxLength,
    this.fillColor,
    this.editIcon,
    this.onChanged,
    this.onTap,
    this.errorText,
    this.maxLines,
    this.minLines,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final FocusNode focusNode;
  final String? title;
  final String hintText;
  final Color? fillColor;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? prefixIcon;
  final Widget? editIcon;
  final bool isPassword;
  final bool isFilled;
  final bool readOnly;
  final bool? customFilled;
  final int? maxLength;
  final String? errorText;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final void Function()? onSuffixIconPressed;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(title!, style: Theme.of(context).textTheme.bodySmall),

        const SizedBox(height: AppSizes.sm),

        TextFormField(
          maxLines: obscureText ? 1 : null,
          minLines: minLines,
          cursorColor: AppColors.primary,
          maxLength: maxLength,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          readOnly: readOnly,
          focusNode: focusNode,
          textInputAction: textInputAction,
          controller: controller,
          keyboardType: keyboardType,
          onTap: onTap,
          inputFormatters: inputFormatters,

          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: isDark ? AppColors.textPrimary : Colors.black,
          ),

          decoration: InputDecoration(
            errorText: errorText,

            filled: isFilled,
            fillColor:
                fillColor ??
                (customFilled ?? true
                    ? AppColors.surface.withOpacity(0.5)
                    : null),

            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),

            contentPadding: const EdgeInsets.all(AppSizes.md),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusM),
              borderSide: BorderSide.none,
            ),

            prefixIcon: prefixIcon == null
                ? null
                : Padding(
                    padding: const EdgeInsets.all(AppSizes.md),
                    child: SvgPicture.asset(
                      'assets/svg/$prefixIcon.svg',
                      colorFilter: const ColorFilter.mode(
                        AppColors.textSecondary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),

            suffixIcon: customFilled ?? false
                ? Padding(
                    padding: const EdgeInsets.all(AppSizes.sm),
                    child: editIcon,
                  )
                : isPassword
                ? IconButton(
                    onPressed: onSuffixIconPressed,
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.textSecondary,
                    ),
                  )
                : null,
          ),

          obscureText: obscureText,
          validator: validator,
        ),
      ],
    );
  }
}
