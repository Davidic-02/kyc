import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/core/services/toast_services.dart';
import 'package:kyc/core/widgets/custom_button.dart';
import 'package:kyc/features/kyc/bloc/kyc/kyc_bloc.dart';
import 'package:kyc/features/kyc/data/list/kyc_steps.dart';

class KycSelfieScreen extends HookWidget {
  const KycSelfieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useState<CameraController?>(null);
    final capturedImagePath = useState<String?>(null);
    final isCameraReady = useState(false);
    final isInitializing = useState(true);

    // Init front camera
    useEffect(() {
      _initCamera(controller, isCameraReady, isInitializing);
      return () {
        controller.value?.dispose();
      };
    }, const []);

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
              final isBusy = state.selfieStatus == KycStepStatus.loading;

              return Column(
                children: [
                  // ── Header ───────────────────────────────────────────
                  Padding(
                    padding: const EdgeInsets.all(AppSizes.radiusL),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              'Selfie Capture',
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(color: AppColors.textPrimary),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: const LinearProgressIndicator(
                            value: 0.6,
                            minHeight: 4,
                            backgroundColor: AppColors.surface,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          capturedImagePath.value == null
                              ? 'Position your face in the frame and take a clear selfie'
                              : 'Looking good! Confirm or retake.',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),

                  // ── Camera / Preview ─────────────────────────────────
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: ClipOval(
                        child: capturedImagePath.value != null
                            // Show captured image for review
                            ? Image.file(
                                File(capturedImagePath.value!),
                                fit: BoxFit.cover,
                              )
                            : isInitializing.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primary,
                                ),
                              )
                            : isCameraReady.value && controller.value != null
                            ? CameraPreview(controller.value!)
                            : const Center(
                                child: Text(
                                  'Camera unavailable',
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // ── Tips ─────────────────────────────────────────────
                  if (capturedImagePath.value == null) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.radiusL,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _Tip(
                            icon: Icons.wb_sunny_outlined,
                            label: 'Good lighting',
                          ),
                          const SizedBox(width: 24),
                          _Tip(icon: Icons.face, label: 'Face forward'),
                          const SizedBox(width: 24),
                          _Tip(
                            icon: Icons.no_photography_outlined,
                            label: 'No glasses',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],

                  // ── Action buttons ───────────────────────────────────
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppSizes.radiusL,
                      0,
                      AppSizes.radiusL,
                      AppSizes.radiusL,
                    ),
                    child: capturedImagePath.value == null
                        ? Button(
                            'Take Selfie',
                            onPressed: isCameraReady.value
                                ? () async {
                                    final path = await _takePicture(
                                      controller.value,
                                    );
                                    if (path != null) {
                                      capturedImagePath.value = path;
                                    }
                                  }
                                : null,
                          )
                        : Column(
                            children: [
                              Button(
                                isBusy ? 'Saving...' : 'Use This Photo',
                                busy: isBusy,
                                onPressed: isBusy
                                    ? null
                                    : () => context.read<KycBloc>().add(
                                        KycEvent.selfieCaptureDone(
                                          selfieUrl: capturedImagePath.value!,
                                        ),
                                      ),
                              ),
                              const SizedBox(height: 12),
                              Button(
                                'Retake',
                                color: AppColors.surface,
                                textColor: AppColors.textPrimary,
                                onPressed: () {
                                  capturedImagePath.value = null;
                                },
                              ),
                            ],
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _initCamera(
    ValueNotifier<CameraController?> controller,
    ValueNotifier<bool> isCameraReady,
    ValueNotifier<bool> isInitializing,
  ) async {
    try {
      final cameras = await availableCameras();
      final front = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );
      final cam = CameraController(front, ResolutionPreset.high);
      await cam.initialize();
      controller.value = cam;
      isCameraReady.value = true;
    } catch (_) {
      isCameraReady.value = false;
    } finally {
      isInitializing.value = false;
    }
  }

  Future<String?> _takePicture(CameraController? cam) async {
    if (cam == null || !cam.value.isInitialized) return null;
    try {
      final file = await cam.takePicture();
      return file.path;
    } catch (_) {
      return null;
    }
  }
}

class _Tip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _Tip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary, size: 22),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 11),
        ),
      ],
    );
  }
}
