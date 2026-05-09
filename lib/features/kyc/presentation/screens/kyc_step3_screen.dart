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
import 'package:kyc/features/kyc/data/list/kyc_steps.dart';

class KycStep3Screen extends HookWidget {
  const KycStep3Screen({super.key});

  static const _docTypes = [
    'NIN',
    'Passport',
    "Driver's Licence",
    "Voter's Card",
  ];

  @override
  Widget build(BuildContext context) {
    // Focus node only — no TextEditingController, no local state
    final docNumberFocus = useFocusNode();

    return BlocListener<KycBloc, KycState>(
      listenWhen: (prev, curr) =>
          prev.currentStep != curr.currentStep ||
          prev.errorMessage != curr.errorMessage,
      listener: (context, state) {
        if (state.errorMessage.isNotEmpty) {
          ToastService.toast(state.errorMessage, ToastType.error);
        }
        if (state.currentStep == KycSteps.completed) {
          context.goNamed('kyc_completion');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<KycBloc, KycState>(
            builder: (context, state) {
              final isBusy = state.documentStatus == KycStepStatus.loading;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(AppSizes.radiusL),
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

                    // ── Progress bar ─────────────────────────────────────
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

                    // ── Document type chips ──────────────────────────────
                    Text(
                      'Select document type',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: AppSizes.sm),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _docTypes.map((type) {
                        final isSelected = state.docType == type;
                        return GestureDetector(
                          onTap: () => context.read<KycBloc>().add(
                            KycEvent.docTypeChanged(type),
                          ),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.surface.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(
                                AppSizes.radiusM,
                              ),
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
                                fontSize: 14,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 24),

                    // ── Document number ──────────────────────────────────
                    CustomTextFormField(
                      title: 'Document Number',
                      hintText: 'Enter your document number',
                      focusNode: docNumberFocus,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      // Bloc owns the value — dispatch on every change
                      onChanged: (v) => context.read<KycBloc>().add(
                        KycEvent.docNumberChanged(v),
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
                      onPressed: isBusy || !state.isDocumentValid
                          ? null
                          : () => context.read<KycBloc>().add(
                              const KycEvent.documentSaved(),
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
