import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/core/services/toast_services.dart';
import 'package:kyc/core/utils/validators.dart';
import 'package:kyc/core/widgets/custom_button.dart';
import 'package:kyc/core/widgets/custom_textfield.dart';

import 'package:kyc/features/kyc/bloc/kyc/kyc_bloc.dart';
import 'package:kyc/features/kyc/data/list/country_list.dart';
import 'package:kyc/features/kyc/data/list/kyc_steps.dart';

class KycStep1Screen extends HookWidget {
  const KycStep1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final firstNameFocus = useFocusNode();
    final lastNameFocus = useFocusNode();

    // Local state for the selected date — derived age goes to bloc
    final selectedDate = useState<DateTime?>(null);

    // Calculate age from a date of birth
    int _calculateAge(DateTime dob) {
      final today = DateTime.now();
      int age = today.year - dob.year;
      if (today.month < dob.month ||
          (today.month == dob.month && today.day < dob.day)) {
        age--;
      }
      return age;
    }

    // Open the date picker and dispatch age to bloc
    Future<void> _pickDate() async {
      final now = DateTime.now();
      final picked = await showDatePicker(
        context: context,
        // Default to showing ~25 years ago
        initialDate:
            selectedDate.value ?? DateTime(now.year - 25, now.month, now.day),
        // Must be at least 18 years old
        firstDate: DateTime(now.year - 100),
        lastDate: DateTime(now.year - 18, now.month, now.day),
        helpText: 'Select your date of birth',
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.dark(
                primary: AppColors.primary,
                onPrimary: Colors.white,
                surface: AppColors.surface,
                onSurface: AppColors.textPrimary,
              ),
              dialogTheme: const DialogThemeData(
                backgroundColor: AppColors.background,
              ),
            ),
            child: child!,
          );
        },
      );

      if (picked != null) {
        selectedDate.value = picked;
        final age = _calculateAge(picked);
        // Send the calculated age string to the bloc — same field, no state changes needed
        context.read<KycBloc>().add(KycEvent.ageChanged(age.toString()));
        // Also send the DOB as a formatted string for storage
        context.read<KycBloc>().add(
          KycEvent.dobChanged(
            '${picked.day.toString().padLeft(2, '0')}/'
            '${picked.month.toString().padLeft(2, '0')}/'
            '${picked.year}',
          ),
        );
      }
    }

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
              final hasDate = selectedDate.value != null;
              final calculatedAge = hasDate
                  ? _calculateAge(selectedDate.value!)
                  : null;

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.lg,
                  vertical: AppSizes.md,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    // ── Header ──────────────────────────────────────────
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          'Stocks',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w900,
                                color: AppColors.textPrimary,
                              ),
                        ),
                        const SizedBox(height: 4),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lock_outline,
                              size: 11,
                              color: AppColors.textSecondary,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '100% non-custodial',
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 8,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'KYC Verification',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Step 1 of 4',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.textSecondary),
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
                      hintText: 'First Name',
                      focusNode: firstNameFocus,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onChanged: (v) => context.read<KycBloc>().add(
                        KycEvent.firstNameChanged(v),
                      ),
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(lastNameFocus),
                      errorText: state.firstName.isPure
                          ? null
                          : state.firstName.displayError?.message('First name'),
                    ),

                    const SizedBox(height: 16),

                    // ── Last Name ────────────────────────────────────────
                    CustomTextFormField(
                      title: 'Last Name',
                      hintText: 'Last Name',
                      focusNode: lastNameFocus,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onChanged: (v) => context.read<KycBloc>().add(
                        KycEvent.lastNameChanged(v),
                      ),
                      errorText: state.lastName.isPure
                          ? null
                          : state.lastName.displayError?.message('Last name'),
                    ),

                    const SizedBox(height: 16),

                    // ── Date of Birth + Age badge ────────────────────────
                    Text(
                      'Date of Birth',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: AppSizes.sm),

                    GestureDetector(
                      onTap: _pickDate,
                      child: Container(
                        padding: const EdgeInsets.all(AppSizes.md),
                        decoration: BoxDecoration(
                          color: AppColors.surface.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(AppSizes.radiusM),
                          border: hasDate
                              ? Border.all(
                                  color: AppColors.primary.withOpacity(0.4),
                                  width: 1,
                                )
                              : null,
                        ),
                        child: Row(
                          children: [
                            // Calendar icon
                            const Icon(
                              Icons.calendar_today_outlined,
                              color: AppColors.primary,
                              size: 18,
                            ),
                            const SizedBox(width: 12),

                            // Selected date or placeholder
                            Expanded(
                              child: Text(
                                hasDate
                                    ? '${selectedDate.value!.day.toString().padLeft(2, '0')} / '
                                          '${selectedDate.value!.month.toString().padLeft(2, '0')} / '
                                          '${selectedDate.value!.year}'
                                    : 'Select date of birth',
                                style: TextStyle(
                                  color: hasDate
                                      ? AppColors.textPrimary
                                      : AppColors.textSecondary,
                                  fontSize: 14,
                                ),
                              ),
                            ),

                            // ── Age badge — appears after date is picked ──
                            if (hasDate && calculatedAge != null)
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  '$calculatedAge yrs',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),

                    // Under-field hint
                    if (!hasDate)
                      Padding(
                        padding: const EdgeInsets.only(top: 6, left: 4),
                        child: Text(
                          'You must be at least 18 years old',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: AppColors.textSecondary.withOpacity(0.6),
                                fontSize: 11,
                              ),
                        ),
                      ),

                    const SizedBox(height: 16),

                    // ── Gender dropdown ──────────────────────────────────
                    _KycDropdown(
                      title: 'Gender',
                      hint: 'Select gender',
                      value: state.gender.value.isEmpty
                          ? null
                          : state.gender.value,
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
                      value: state.country.value.isEmpty
                          ? null
                          : state.country.value,
                      items: kAllCountries,
                      onChanged: (v) => context.read<KycBloc>().add(
                        KycEvent.countryChanged(v ?? ''),
                      ),
                    ),

                    const SizedBox(height: 40),

                    if (state.errorMessage.isNotEmpty) ...[
                      Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                      const SizedBox(height: 12),
                    ],

                    const SizedBox(height: 60),

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
        GestureDetector(
          onTap: () async {
            final selected = await showModalBottomSheet<String>(
              context: context,
              backgroundColor: AppColors.background,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              builder: (_) => ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                    title: Text(item),
                    onTap: () => Navigator.pop(context, item),
                  );
                },
              ),
            );
            if (selected != null) onChanged(selected);
          },
          child: Container(
            padding: const EdgeInsets.all(AppSizes.md),
            decoration: BoxDecoration(
              color: AppColors.surface.withOpacity(0.5),
              borderRadius: BorderRadius.circular(AppSizes.radiusM),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value ?? hint,
                  style: TextStyle(
                    color: value == null
                        ? AppColors.textSecondary
                        : AppColors.textPrimary,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
