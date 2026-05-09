import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';

import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/core/constants/app_sizes.dart';
import 'package:kyc/core/services/toast_services.dart';
import 'package:kyc/core/widgets/custom_button.dart';
import 'package:kyc/features/kyc/bloc/kyc/kyc_bloc.dart';
import 'package:kyc/features/kyc/data/list/kyc_steps.dart';

class KycLocationScreen extends HookWidget {
  const KycLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final position = useState<Position?>(null);
    final detectedCountry = useState<String>('');
    final isFetching = useState(false);
    final locationError = useState<String>('');

    return BlocListener<KycBloc, KycState>(
      listenWhen: (prev, curr) =>
          prev.currentStep != curr.currentStep ||
          prev.errorMessage != curr.errorMessage,
      listener: (context, state) {
        if (state.errorMessage.isNotEmpty) {
          ToastService.toast(state.errorMessage, ToastType.error);
        }
        if (state.currentStep == KycSteps.proofOfAddress) {
          context.goNamed('kyc_proof_of_address');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<KycBloc, KycState>(
            builder: (context, state) {
              final isBusy = state.locationStatus == KycStepStatus.loading;
              final hasLocation = position.value != null;

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
                          'Location Verification',
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

                    // ── Info card ─────────────────────────────────────────
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSizes.md),
                      decoration: BoxDecoration(
                        color: AppColors.surface.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(AppSizes.radiusM),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            hasLocation
                                ? Icons.location_on
                                : Icons.location_searching,
                            color: hasLocation
                                ? AppColors.primary
                                : AppColors.textSecondary,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            hasLocation
                                ? 'Location captured'
                                : 'We need your location to verify your region',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          if (hasLocation) ...[
                            const SizedBox(height: 12),
                            _InfoRow(
                              label: 'Country',
                              value: detectedCountry.value.isEmpty
                                  ? 'Detecting...'
                                  : detectedCountry.value,
                            ),
                            const SizedBox(height: 8),
                            _InfoRow(
                              label: 'Latitude',
                              value: position.value!.latitude.toStringAsFixed(
                                4,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _InfoRow(
                              label: 'Longitude',
                              value: position.value!.longitude.toStringAsFixed(
                                4,
                              ),
                            ),
                          ],
                          if (!hasLocation) ...[
                            const SizedBox(height: 8),
                            Text(
                              'Your coordinates are stored securely and only used for compliance checks.',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: AppColors.textSecondary),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ],
                      ),
                    ),

                    // ── Location error ────────────────────────────────────
                    if (locationError.value.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      Text(
                        locationError.value,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ],

                    const SizedBox(height: 40),

                    // ── Get location button ───────────────────────────────
                    if (!hasLocation)
                      Button(
                        isFetching.value
                            ? 'Getting location...'
                            : 'Get My Location',
                        busy: isFetching.value,
                        onPressed: isFetching.value
                            ? null
                            : () => _fetchLocation(
                                isFetching,
                                position,
                                detectedCountry,
                                locationError,
                              ),
                      ),

                    // ── Confirm button ────────────────────────────────────
                    if (hasLocation)
                      Button(
                        isBusy ? 'Saving...' : 'Confirm Location',
                        busy: isBusy,
                        onPressed: isBusy
                            ? null
                            : () => context.read<KycBloc>().add(
                                KycEvent.locationCaptured(
                                  latitude: position.value!.latitude,
                                  longitude: position.value!.longitude,
                                  detectedCountry: detectedCountry.value,
                                  // Future: add real VPN detection via backend
                                  isVpnSuspected: false,
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

  Future<void> _fetchLocation(
    ValueNotifier<bool> isFetching,
    ValueNotifier<Position?> position,
    ValueNotifier<String> detectedCountry,
    ValueNotifier<String> locationError,
  ) async {
    isFetching.value = true;
    locationError.value = '';

    try {
      // Check / request permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.deniedForever) {
        locationError.value =
            'Location permission permanently denied. Enable it in Settings.';
        return;
      }

      final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      position.value = pos;

      // Reverse geocode to get country name
      try {
        final placemarks = await placemarkFromCoordinates(
          pos.latitude,
          pos.longitude,
        );
        detectedCountry.value = placemarks.first.country ?? 'Unknown';
      } catch (_) {
        detectedCountry.value = 'Unknown';
      }
    } catch (e) {
      locationError.value = 'Could not get location: ${e.toString()}';
    } finally {
      isFetching.value = false;
    }
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
        ),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
