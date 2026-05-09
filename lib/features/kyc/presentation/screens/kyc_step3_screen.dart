import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/features/kyc/bloc/kyc/kyc_bloc.dart';

import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/features/kyc/data/list/kyc_steps.dart';

import 'package:kyc/core/widgets/custom_button.dart';

class KycStep3Screen extends StatefulWidget {
  const KycStep3Screen({super.key});

  @override
  State<KycStep3Screen> createState() => _KycStep3ScreenState();
}

class _KycStep3ScreenState extends State<KycStep3Screen> {
  String? _selectedDocType = 'NIN';
  final _docNumberController = TextEditingController();

  final _docTypes = ['NIN', 'Passport', "Driver's Licence", "Voter's Card"];

  @override
  void dispose() {
    _docNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<KycBloc, KycState>(
      listenWhen: (prev, curr) => prev.currentStep != curr.currentStep,
      listener: (context, state) {
        if (state.currentStep == KycSteps.completed) {
          context.goNamed('kyc_completion');
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
                      'Document Verification',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(color: AppColors.textPrimary),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: const LinearProgressIndicator(
                    value: 0.75,
                    minHeight: 4,
                    backgroundColor: AppColors.surface,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(height: 32),

                Text(
                  'Select document type',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _docTypes.map((type) {
                    final isSelected = _selectedDocType == type;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedDocType = type),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.surface,
                          borderRadius: BorderRadius.circular(AppSizes.radiusM),
                        ),
                        child: Text(
                          type,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : AppColors.textSecondary,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 24),

                Text(
                  'Document number',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: _docNumberController,
                  style: const TextStyle(color: AppColors.textPrimary),
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: 'Enter your document number',
                    hintStyle: const TextStyle(color: AppColors.textSecondary),
                    filled: true,
                    fillColor: AppColors.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusM),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                BlocBuilder<KycBloc, KycState>(
                  buildWhen: (prev, curr) =>
                      prev.documentStatus != curr.documentStatus ||
                      prev.errorMessage != curr.errorMessage,
                  builder: (context, state) {
                    final isBusy =
                        state.documentStatus == KycStepStatus.loading;
                    final isValid =
                        _docNumberController.text.trim().isNotEmpty &&
                        _selectedDocType != null;

                    return Column(
                      children: [
                        Button(
                          isBusy ? 'Saving...' : 'Continue',
                          busy: isBusy,
                          onPressed: isBusy || !isValid
                              ? null
                              : () => context.read<KycBloc>().add(
                                  KycEvent.documentSaved(
                                    documentType: _selectedDocType!,
                                    documentNumber: _docNumberController.text
                                        .trim(),
                                    documentUrl: '',
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
