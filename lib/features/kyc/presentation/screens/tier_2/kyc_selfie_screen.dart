import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/core/services/toast_services.dart';
import 'package:kyc/core/widgets/custom_button.dart';
import 'package:kyc/features/kyc/bloc/kyc/kyc_bloc.dart';
import 'package:kyc/features/kyc/data/list/kyc_steps.dart';

class KycSelfieScreen extends HookWidget {
  const KycSelfieScreen({super.key});

  Future<bool> _requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isDenied) status = await Permission.camera.request();
    if (status.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }
    return status.isGranted;
  }

  @override
  Widget build(BuildContext context) {
    final controller = useState<CameraController?>(null);
    final capturedImagePath = useState<String?>(null);
    final isCameraReady = useState(false);
    final isInitializing = useState(true);

    useEffect(() {
      Future.microtask(() async {
        final granted = await _requestCameraPermission();
        if (!granted) {
          isInitializing.value = false;
          isCameraReady.value = false;
          return;
        }
        await _initCamera(controller, isCameraReady, isInitializing);
      });
      return () => controller.value?.dispose();
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
                  // ── Header ─────────────────────────────────────────
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // App name (same pattern as Location screen)
                      Text(
                        'Stocks', // <- change this to your REAL app name if needed
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColors.textPrimary,
                            ),
                      ),

                      const SizedBox(height: 4),

                      // Trust line (same pattern as your location screen)
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
                            'Secure identity verification',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Step title (your actual screen purpose)
                      Text(
                        'Selfie Capture',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                      ),
                    ],
                  ),

                  // ── Camera / Preview ─────────────────────────────────
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: ClipOval(
                        child: capturedImagePath.value != null
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
                        ? Column(
                            children: [
                              Button(
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
                              ),
                              const SizedBox(height: 12),
                              Button(
                                'Skip for now',
                                color: AppColors.surface,
                                textColor: AppColors.textSecondary,
                                onPressed: () =>
                                    context.goNamed('kyc_proof_of_address'),
                              ),
                            ],
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
                                onPressed: () => capturedImagePath.value = null,
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
    } catch (e) {
      debugPrint('Camera error: $e');
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
