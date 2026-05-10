// ════════════════════════════════════════════════════════════════════════════
// kyc_proof_of_address_screen.dart  — Step 6
// ════════════════════════════════════════════════════════════════════════════

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/core/services/toast_services.dart';
import 'package:kyc/core/widgets/custom_button.dart';
import 'package:kyc/features/kyc/bloc/kyc/kyc_bloc.dart';
import 'package:kyc/features/kyc/data/list/kyc_steps.dart';

class KycProofOfAddressScreen extends HookWidget {
  const KycProofOfAddressScreen({super.key});

  static const _docTypes = [
    'Utility Bill',
    'Bank Statement',
    'Rental Agreement',
    'Government Letter',
  ];

  @override
  Widget build(BuildContext context) {
    final pickedImagePath = useState<String?>(null);

    return BlocListener<KycBloc, KycState>(
      listenWhen: (prev, curr) =>
          prev.currentStep != curr.currentStep ||
          prev.errorMessage != curr.errorMessage,
      listener: (context, state) {
        if (state.errorMessage.isNotEmpty) {
          ToastService.toast(state.errorMessage, ToastType.error);
        }
        if (state.currentStep == KycSteps.locationVerify) {
          context.goNamed('kyc_location');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<KycBloc, KycState>(
            builder: (context, state) {
              final isBusy =
                  state.proofOfAddressStatus == KycStepStatus.loading;
              final hasImage = pickedImagePath.value != null;
              final isValid = hasImage;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(AppSizes.radiusL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    // ── Header ─────────────────────────────────────────
                    // ── Header ───────────────────────────────────────────
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                        const SizedBox(height: 12),

                        // 🔵 BRAND
                        Text(
                          'Stocks',
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
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // 🔵 PAGE TITLE
                        Text(
                          'Proof of Address',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
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

                    // ── Document type chips ────────────────────────────
                    const SizedBox(height: AppSizes.sm),

                    // ── Document type ─────────────────────────────────────
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Document type',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),

                        const SizedBox(height: AppSizes.sm),

                        Column(
                          children: _docTypes.map((type) {
                            final isSelected =
                                state.proofOfAddressDocType == type;

                            return GestureDetector(
                              onTap: () => context.read<KycBloc>().add(
                                KycEvent.proofOfAddressDocTypeChanged(type),
                              ),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.surface.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.radiusM,
                                  ),
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.primary
                                        : Colors.transparent,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      type,
                                      style: TextStyle(
                                        color: isSelected
                                            ? AppColors.textPrimary
                                            : AppColors.textSecondary,
                                        fontWeight: isSelected
                                            ? FontWeight.w600
                                            : FontWeight.normal,
                                      ),
                                    ),
                                    if (isSelected)
                                      const Icon(
                                        Icons.check_circle,
                                        color: AppColors.primary,
                                        size: 20,
                                      )
                                    else
                                      const SizedBox(width: 20),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // ── Upload area ────────────────────────────────────
                    Text(
                      'Upload document',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: AppSizes.sm),

                    GestureDetector(
                      onTap: () => _pickImage(pickedImagePath),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: double.infinity,
                        height: hasImage ? 220 : 140,
                        decoration: BoxDecoration(
                          color: AppColors.surface.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(AppSizes.radiusM),
                          border: Border.all(
                            color: hasImage
                                ? AppColors.primary
                                : AppColors.textSecondary.withOpacity(0.3),
                            width: 1.5,
                          ),
                        ),
                        child: hasImage
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  AppSizes.radiusM,
                                ),
                                child: Image.file(
                                  File(pickedImagePath.value!),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.cloud_upload_outlined,
                                    color: AppColors.textSecondary,
                                    size: 40,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Tap to upload or take a photo',
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(
                                          color: AppColors.textSecondary,
                                        ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'JPG, PNG or PDF — max 5MB',
                                    style: TextStyle(
                                      color: AppColors.textSecondary
                                          .withOpacity(0.6),
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),

                    if (hasImage)
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          onPressed: () => _pickImage(pickedImagePath),
                          icon: const Icon(
                            Icons.refresh,
                            color: AppColors.textSecondary,
                            size: 16,
                          ),
                          label: const Text(
                            'Change',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),

                    const SizedBox(height: 8),

                    // ── Requirement note ───────────────────────────────
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(AppSizes.radiusM),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.info_outline,
                            color: AppColors.primary,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Document must show your name and address clearly. '
                              'Must be issued within the last 3 months.',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: AppColors.textSecondary),
                            ),
                          ),
                        ],
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

                    Button(
                      isBusy ? 'Submitting...' : 'Continue',
                      busy: isBusy,
                      onPressed: isBusy || !isValid
                          ? null
                          : () => context.read<KycBloc>().add(
                              KycEvent.proofOfAddressUploaded(
                                documentUrl: pickedImagePath.value!,
                              ),
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

  Future<void> _pickImage(ValueNotifier<String?> pickedImagePath) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (picked != null) {
      pickedImagePath.value = picked.path;
    }
  }
}

// ════════════════════════════════════════════════════════════════════════════
// kyc_tier2_completion_screen.dart  — Tier 2 done, pending review
// ════════════════════════════════════════════════════════════════════════════

class KycTier2CompletionScreen extends HookWidget {
  const KycTier2CompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<KycBloc, KycState>(
      listenWhen: (prev, curr) =>
          prev.tier2SubmitStatus != curr.tier2SubmitStatus,
      listener: (context, state) {
        if (state.tier2SubmitStatus == KycStepStatus.success) {
          context.goNamed('home');
        } else if (state.tier2SubmitStatus == KycStepStatus.failure) {
          ToastService.toast(state.errorMessage, ToastType.error);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.radiusL),
            child: BlocBuilder<KycBloc, KycState>(
              builder: (context, state) {
                final isBusy = state.tier2SubmitStatus == KycStepStatus.loading;

                return Column(
                  children: [
                    const Spacer(),

                    // ── Icon ──────────────────────────────────────────
                    Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary.withOpacity(0.12),
                      ),
                      child: const Icon(
                        Icons.hourglass_top_rounded,
                        size: 48,
                        color: AppColors.primary,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Text(
                      'Submitted for Review',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Your Tier 2 documents are being reviewed by our compliance team. '
                      'This usually takes 1–2 business days.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 40),

                    // ── What was submitted ────────────────────────────
                    _ReviewRow(
                      icon: Icons.camera_alt_outlined,
                      title: 'Selfie',
                      status: 'Pending review',
                    ),
                    const SizedBox(height: 12),
                    _ReviewRow(
                      icon: Icons.location_on_outlined,
                      title: 'Location',
                      status: 'Captured',
                    ),
                    const SizedBox(height: 12),
                    _ReviewRow(
                      icon: Icons.description_outlined,
                      title: 'Proof of Address',
                      status: 'Pending review',
                    ),

                    const SizedBox(height: 40),

                    // ── What's unlocked note ──────────────────────────
                    Container(
                      padding: const EdgeInsets.all(AppSizes.md),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(AppSizes.radiusM),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.lock_open_outlined,
                            color: AppColors.primary,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Once approved, you\'ll unlock higher transaction limits '
                              'and full trading access.',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: AppColors.textSecondary),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ── Future: Onfido/Rekognition hook ───────────────
                    // TODO: When integrating a liveness API, call it here:
                    // await OnfidoService.submitApplicant(selfieUrl, uid);
                    // await RekognitionService.compareFaces(selfieUrl, docUrl);
                    const Spacer(),

                    Button(
                      isBusy ? 'Submitting...' : 'Done — Go to Home',
                      busy: isBusy,
                      onPressed: isBusy
                          ? null
                          : () => context.read<KycBloc>().add(
                              const KycEvent.tier2Submitted(),
                            ),
                    ),

                    const SizedBox(height: AppSizes.radiusL),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _ReviewRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String status;

  const _ReviewRow({
    required this.icon,
    required this.title,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(AppSizes.radiusM),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withOpacity(0.12),
            ),
            child: Icon(icon, color: AppColors.primary, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
