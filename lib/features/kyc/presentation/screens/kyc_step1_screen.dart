import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/core/services/toast_services.dart';
import 'package:kyc/core/widgets/custom_button.dart';
import 'package:kyc/core/widgets/custom_textfield.dart';

import 'package:kyc/features/kyc/bloc/kyc/kyc_bloc.dart';
import 'package:kyc/features/kyc/data/list/country_list.dart';
import 'package:kyc/features/kyc/data/list/kyc_steps.dart';

// ─── World Countries ────────────────────────────────────────────────────────

class KycStep1Screen extends HookWidget {
  const KycStep1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Focus nodes only — no TextControllers, no local value state
    final firstNameFocus = useFocusNode();
    final lastNameFocus = useFocusNode();
    final ageFocus = useFocusNode();

    return BlocListener<KycBloc, KycState>(
      listenWhen: (prev, curr) =>
          prev.errorMessage != curr.errorMessage ||
          prev.basicInfoStatus != curr.basicInfoStatus ||
          prev.currentStep != curr.currentStep,
      listener: (context, state) {
        if (state.errorMessage.isNotEmpty) {
          ToastService.toast(state.errorMessage, ToastType.error);
        }
        if (state.basicInfoStatus == KycStepStatus.success) {
          ToastService.toast('Basic info saved', ToastType.success);
        }
        if (state.currentStep == KycSteps.twoFactorSetup) {
          context.goNamed('kyc_progress');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<KycBloc, KycState>(
            builder: (context, state) {
              final isBusy = state.basicInfoStatus == KycStepStatus.loading;

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.lg,
                  vertical: AppSizes.md,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    // ── Header ───────────────────────────────────────────
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => context.read<KycBloc>().add(
                            const KycEvent.previousStep(),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Basic Information',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(color: AppColors.textPrimary),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // ── Progress ─────────────────────────────────────────
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: const LinearProgressIndicator(
                        value: 0.25,
                        minHeight: 4,
                        backgroundColor: AppColors.surface,
                        color: AppColors.primary,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // ── First Name ───────────────────────────────────────
                    CustomTextFormField(
                      title: 'First Name',
                      hintText: 'John',
                      focusNode: firstNameFocus,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      // Bloc owns the value — pass it back on change
                      onChanged: (v) => context.read<KycBloc>().add(
                        KycEvent.firstNameChanged(v),
                      ),
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(lastNameFocus),
                      errorText:
                          state.firstName.isEmpty &&
                              state.basicInfoStatus == KycStepStatus.failure
                          ? 'Required'
                          : null,
                    ),

                    const SizedBox(height: 16),

                    // ── Last Name ────────────────────────────────────────
                    CustomTextFormField(
                      title: 'Last Name',
                      hintText: 'Doe',
                      focusNode: lastNameFocus,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onChanged: (v) => context.read<KycBloc>().add(
                        KycEvent.lastNameChanged(v),
                      ),
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(ageFocus),
                    ),

                    const SizedBox(height: 16),

                    // ── Age ──────────────────────────────────────────────
                    CustomTextFormField(
                      title: 'Age',
                      hintText: '25',
                      focusNode: ageFocus,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      onChanged: (v) =>
                          context.read<KycBloc>().add(KycEvent.ageChanged(v)),
                    ),

                    const SizedBox(height: 16),

                    // ── Gender dropdown ──────────────────────────────────
                    _KycDropdown(
                      title: 'Gender',
                      hint: 'Select gender',
                      value: state.gender.isEmpty ? null : state.gender,
                      items: const ['Male', 'Female', 'Other'],
                      onChanged: (v) => context.read<KycBloc>().add(
                        KycEvent.genderChanged(v ?? ''),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ── Country dropdown ─────────────────────────────────
                    _KycDropdown(
                      title: 'Country',
                      hint: 'Select country',
                      value: state.country.isEmpty ? null : state.country,
                      items: kAllCountries,
                      onChanged: (v) => context.read<KycBloc>().add(
                        KycEvent.countryChanged(v ?? ''),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // ── Error message ────────────────────────────────────
                    if (state.errorMessage.isNotEmpty) ...[
                      Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                      const SizedBox(height: 12),
                    ],

                    // ── Continue button ──────────────────────────────────
                    Button(
                      isBusy ? 'Saving...' : 'Continue',
                      busy: isBusy,
                      onPressed: isBusy || !state.isBasicInfoValid
                          ? null
                          : () => context.read<KycBloc>().add(
                              const KycEvent.basicInfoSaved(),
                            ),
                    ),

                    const SizedBox(height: 24),
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

// ─── Reusable KYC Dropdown ───────────────────────────────────────────────────
class _KycDropdown extends StatelessWidget {
  final String title;
  final String hint;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const _KycDropdown({
    required this.title,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: AppSizes.sm),
        DropdownButtonFormField<String>(
          value: value,
          isExpanded: true,
          dropdownColor: AppColors.surface,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
            filled: true,
            fillColor: AppColors.surface.withOpacity(0.5),
            contentPadding: const EdgeInsets.all(AppSizes.md),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusM),
              borderSide: BorderSide.none,
            ),
          ),
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
