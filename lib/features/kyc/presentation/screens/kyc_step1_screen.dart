import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/features/kyc/bloc/kyc/kyc_bloc.dart';

import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/features/kyc/data/list/kyc_steps.dart';

import 'package:kyc/core/widgets/custom_button.dart';

class KycStep1Screen extends HookWidget {
  const KycStep1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final ageController = useTextEditingController();
    final selectedGender = useState<String?>(null);
    final selectedCountry = useState<String?>(null);

    // Pre-fill if the user already completed this step
    useEffect(() {
      final info = context.read<KycBloc>().state.basicInfo;
      if (info != null) {
        firstNameController.text = info.firstName;
        lastNameController.text = info.lastName;
        ageController.text = info.age;
        selectedGender.value = info.gender;
        selectedCountry.value = info.country;
      }
      return null;
    }, const []);

    return BlocListener<KycBloc, KycState>(
      // ✅ Only navigate when currentStep changes
      listenWhen: (prev, curr) => prev.currentStep != curr.currentStep,
      listener: (context, state) {
        if (state.currentStep == KycSteps.twoFactorSetup) {
          context.goNamed('kyc_step2_setup');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.radiusL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),

                Row(
                  children: [
                    GestureDetector(
                      // Back = bloc decides previous step
                      onTap: () => context.read<KycBloc>().add(
                        const KycEvent.previousStep(),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
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

                _TextField(
                  label: 'First Name',
                  hint: 'John',
                  controller: firstNameController,
                ),
                const SizedBox(height: 16),
                _TextField(
                  label: 'Last Name',
                  hint: 'Doe',
                  controller: lastNameController,
                ),
                const SizedBox(height: 16),
                _TextField(
                  label: 'Age',
                  hint: '25',
                  controller: ageController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                _DropdownField(
                  label: 'Gender',
                  hint: 'Select gender',
                  value: selectedGender.value,
                  items: const ['Male', 'Female', 'Other'],
                  onChanged: (v) => selectedGender.value = v,
                ),
                const SizedBox(height: 16),
                _DropdownField(
                  label: 'Country',
                  hint: 'Select country',
                  value: selectedCountry.value,
                  items: const [
                    'Nigeria',
                    'Ghana',
                    'Kenya',
                    'South Africa',
                    'USA',
                    'UK',
                    'Canada',
                  ],
                  onChanged: (v) => selectedCountry.value = v,
                ),

                const SizedBox(height: 40),

                BlocBuilder<KycBloc, KycState>(
                  buildWhen: (prev, curr) =>
                      prev.basicInfoStatus != curr.basicInfoStatus ||
                      prev.errorMessage != curr.errorMessage,
                  builder: (context, state) {
                    final isBusy =
                        state.basicInfoStatus == KycStepStatus.loading;

                    final isValid =
                        firstNameController.text.trim().isNotEmpty &&
                        lastNameController.text.trim().isNotEmpty &&
                        ageController.text.trim().isNotEmpty &&
                        selectedGender.value != null &&
                        selectedCountry.value != null;

                    return Column(
                      children: [
                        Button(
                          isBusy ? 'Saving...' : 'Continue',
                          busy: isBusy,
                          onPressed: isBusy || !isValid
                              ? null
                              : () => context.read<KycBloc>().add(
                                  KycEvent.basicInfoSaved(
                                    firstName: firstNameController.text.trim(),
                                    lastName: lastNameController.text.trim(),
                                    gender: selectedGender.value!,
                                    age: ageController.text.trim(),
                                    country: selectedCountry.value!,
                                  ),
                                ),
                        ),
                        if (state.errorMessage.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          Text(
                            state.errorMessage,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ],
                    );
                  },
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const _TextField({
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppColors.textSecondary),
            filled: true,
            fillColor: AppColors.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusM),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

class _DropdownField extends StatelessWidget {
  final String label;
  final String hint;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const _DropdownField({
    required this.label,
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
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: value,
          dropdownColor: AppColors.surface,
          style: const TextStyle(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppColors.textSecondary),
            filled: true,
            fillColor: AppColors.surface,
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
