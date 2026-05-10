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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // 🔙 back button (left aligned)
                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: GestureDetector(
                        //     onTap: () => context.read<KycBloc>().add(
                        //       const KycEvent.previousStep(),
                        //     ),
                        //     child: const Icon(
                        //       Icons.arrow_back_ios,
                        //       color: AppColors.textPrimary,
                        //       size: 18,
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(height: 16),

                        // 🟢 STOCKS (top branding)
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

                        // 🟣 KYC TITLE (BELOW STOCKS)
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
              builder: (_) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        Navigator.pop(context, item);
                      },
                    );
                  },
                );
              },
            );

            if (selected != null) {
              onChanged(selected);
            }
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
