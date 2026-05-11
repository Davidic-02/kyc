import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart' as fm;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart';

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
    // Whether the map picker sheet is open
    final mapOpen = useState(false);
    // The confirmed pin position from the map
    final pickedPosition = useState<LatLng?>(null);
    // Country resolved from the picked position
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
        if (state.currentStep == KycSteps.tier2Completed) {
          context.goNamed('kyc_tier2_completion');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<KycBloc, KycState>(
            builder: (context, state) {
              final isBusy = state.locationStatus == KycStepStatus.loading;
              final hasLocation = pickedPosition.value != null;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(AppSizes.radiusL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    // ── Header ─────────────────────────────────────────
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                        Text(
                          'Location Verification',
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

                    // ── Info card ───────────────────────────────────────
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSizes.md),
                      decoration: BoxDecoration(
                        color: AppColors.surface.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(AppSizes.radiusM),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: Lottie.asset(
                              'assets/animations/KYC Home address verification.json',
                              repeat: true,
                              animate: true,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            hasLocation
                                ? 'Location confirmed'
                                : 'Tap the button below to open the map\nand pin your location',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                            textAlign: TextAlign.center,
                          ),

                          if (hasLocation) ...[
                            const SizedBox(height: 16),

                            // ── Map thumbnail preview ─────────────────
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                AppSizes.radiusM,
                              ),
                              child: SizedBox(
                                height: 160,
                                child: fm.FlutterMap(
                                  options: fm.MapOptions(
                                    initialCenter: pickedPosition.value!,
                                    initialZoom: 14,
                                    interactionOptions:
                                        const fm.InteractionOptions(
                                          flags: fm
                                              .InteractiveFlag
                                              .none, // read-only
                                        ),
                                  ),
                                  children: [
                                    fm.TileLayer(
                                      urlTemplate:
                                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                      userAgentPackageName: 'com.kyc.app',
                                    ),
                                    fm.MarkerLayer(
                                      markers: [
                                        fm.Marker(
                                          point: pickedPosition.value!,
                                          width: 48,
                                          height: 48,
                                          child: const Icon(
                                            Icons.location_pin,
                                            color: Colors.red,
                                            size: 48,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),

                            _InfoRow(
                              label: 'Country',
                              value: detectedCountry.value.isEmpty
                                  ? 'Detecting...'
                                  : detectedCountry.value,
                            ),
                            const SizedBox(height: 8),
                            _InfoRow(
                              label: 'Latitude',
                              value: pickedPosition.value!.latitude
                                  .toStringAsFixed(4),
                            ),
                            const SizedBox(height: 8),
                            _InfoRow(
                              label: 'Longitude',
                              value: pickedPosition.value!.longitude
                                  .toStringAsFixed(4),
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

                    if (locationError.value.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      Text(
                        locationError.value,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ],

                    const SizedBox(height: 32),

                    // ── Open map button ─────────────────────────────────
                    if (!hasLocation)
                      Button(
                        isFetching.value
                            ? 'Opening map...'
                            : 'Open Map & Pick Location',
                        busy: isFetching.value,
                        onPressed: isFetching.value
                            ? null
                            : () => _openMapPicker(
                                context,
                                isFetching,
                                pickedPosition,
                                detectedCountry,
                                locationError,
                              ),
                      ),

                    // ── Re-pick + Confirm ──────────────────────────────
                    if (hasLocation) ...[
                      Button(
                        isBusy ? 'Saving...' : 'Confirm Location',
                        busy: isBusy,
                        onPressed: isBusy
                            ? null
                            : () => context.read<KycBloc>().add(
                                KycEvent.locationCaptured(
                                  latitude: pickedPosition.value!.latitude,
                                  longitude: pickedPosition.value!.longitude,
                                  detectedCountry: detectedCountry.value,
                                  isVpnSuspected: false,
                                ),
                              ),
                      ),
                      const SizedBox(height: 12),
                      Button(
                        'Pick Different Location',
                        color: AppColors.surface,
                        textColor: AppColors.textPrimary,
                        onPressed: () {
                          pickedPosition.value = null;
                          detectedCountry.value = '';
                          locationError.value = '';
                        },
                      ),
                    ],

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

  Future<void> _openMapPicker(
    BuildContext context,
    ValueNotifier<bool> isFetching,
    ValueNotifier<LatLng?> pickedPosition,
    ValueNotifier<String> detectedCountry,
    ValueNotifier<String> locationError,
  ) async {
    isFetching.value = true;
    locationError.value = '';

    // 1. Get GPS first so the map opens centred on the user
    LatLng initialCenter = const LatLng(6.5244, 3.3792); // fallback: Lagos
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.deniedForever) {
        locationError.value =
            'Location permission permanently denied. Enable it in Settings.';
        isFetching.value = false;
        return;
      }
      final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      initialCenter = LatLng(pos.latitude, pos.longitude);
    } catch (_) {
      // Use Lagos fallback silently
    } finally {
      isFetching.value = false;
    }

    // 2. Open the full-screen map picker
    if (!context.mounted) return;
    final result = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => _MapPickerScreen(initialCenter: initialCenter),
      ),
    );

    if (result == null) return; // user dismissed without picking

    // 3. Reverse geocode the picked point
    pickedPosition.value = result;
    try {
      final placemarks = await placemarkFromCoordinates(
        result.latitude,
        result.longitude,
      );
      detectedCountry.value = placemarks.first.country ?? 'Unknown';
    } catch (_) {
      detectedCountry.value = 'Unknown';
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Full-screen map picker — user taps to drop a pin, then confirms
// ─────────────────────────────────────────────────────────────────────────────
class _MapPickerScreen extends HookWidget {
  final LatLng initialCenter;
  const _MapPickerScreen({required this.initialCenter});

  @override
  Widget build(BuildContext context) {
    final mapController = useMemoized(() => fm.MapController());
    final pin = useState<LatLng?>(null);
    // Track address label for the dropped pin
    final pinAddress = useState<String>('');
    final isGeocoding = useState(false);

    Future<void> reverseGeocode(LatLng point) async {
      isGeocoding.value = true;
      try {
        final placemarks = await placemarkFromCoordinates(
          point.latitude,
          point.longitude,
        );
        final p = placemarks.first;
        pinAddress.value = [
          p.street,
          p.locality,
          p.administrativeArea,
          p.country,
        ].where((s) => s != null && s.isNotEmpty).join(', ');
      } catch (_) {
        pinAddress.value = 'Unknown location';
      } finally {
        isGeocoding.value = false;
      }
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // ── Full screen map ───────────────────────────────────────────
          fm.FlutterMap(
            mapController: mapController,
            options: fm.MapOptions(
              initialCenter: initialCenter,
              initialZoom: 14,
              // Every tap drops / moves the pin
              onTap: (tapPosition, point) {
                pin.value = point;
                reverseGeocode(point);
              },
            ),
            children: [
              fm.TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.kyc.app',
              ),
              if (pin.value != null)
                fm.MarkerLayer(
                  markers: [
                    fm.Marker(
                      point: pin.value!,
                      width: 56,
                      height: 56,
                      alignment: Alignment.topCenter,
                      child: const Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 56,
                      ),
                    ),
                  ],
                ),
            ],
          ),

          // ── Top bar ───────────────────────────────────────────────────
          Positioned(
            top: MediaQuery.of(context).padding.top + 12,
            left: 16,
            right: 16,
            child: Row(
              children: [
                // Back
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColors.textPrimary,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Instruction chip
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.touch_app,
                          color: AppColors.primary,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          pin.value == null
                              ? 'Tap map to drop a pin'
                              : 'Tap again to move the pin',
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── GPS re-centre button ──────────────────────────────────────
          Positioned(
            right: 16,
            bottom: pin.value != null ? 180 : 100,
            child: GestureDetector(
              onTap: () {
                mapController.move(initialCenter, 14);
              },
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.my_location,
                  color: AppColors.primary,
                  size: 22,
                ),
              ),
            ),
          ),

          // ── Bottom confirm panel — slides up when pin is placed ───────
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            bottom: pin.value != null ? 0 : -200,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 16,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Drag handle
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary.withOpacity(0.12),
                        ),
                        child: const Icon(
                          Icons.location_on,
                          color: AppColors.primary,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: isGeocoding.value
                            ? const Text(
                                'Fetching address...',
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 13,
                                ),
                              )
                            : Text(
                                pinAddress.value.isEmpty
                                    ? 'Tap map to pick your location'
                                    : pinAddress.value,
                                style: const TextStyle(
                                  color: AppColors.textPrimary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                      ),
                    ],
                  ),

                  if (pin.value != null) ...[
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 52),
                      child: Text(
                        '${pin.value!.latitude.toStringAsFixed(5)}, '
                        '${pin.value!.longitude.toStringAsFixed(5)}',
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 20),

                  Button(
                    'Confirm This Location',
                    onPressed: pin.value == null
                        ? null
                        : () => Navigator.of(context).pop(pin.value),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Info row ─────────────────────────────────────────────────────────────────
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
