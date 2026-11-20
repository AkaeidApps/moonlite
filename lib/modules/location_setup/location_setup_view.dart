import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/global_moonlight_background.dart';
import '../../shared/widgets/glass_container.dart';
import '../../shared/widgets/premium_button.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import 'location_setup_controller.dart';

class LocationSetupView extends GetView<LocationSetupController> {
  const LocationSetupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LocationSetupController());

    return GlobalMoonlightBackground(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Set Your Location',
                style: AppTypography.heading1(),
              ),
              const SizedBox(height: 8),
              Text(
                'Accurate moonrise, moonset, and elevation depend on your observation coordinates.',
                style: AppTypography.body(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 36),
              GlassContainer(
                onTap: controller.detectLocation,
                child: Row(
                  children: [
                    const Icon(Icons.my_location, color: AppColors.primary, size: 28),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Use Current Location', style: AppTypography.heading3()),
                          const SizedBox(height: 4),
                          Text('Automatic GPS detection', style: AppTypography.bodySmall(color: AppColors.textSecondary)),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, color: AppColors.textSecondary, size: 16),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text('Popular Cities', style: AppTypography.heading3(color: AppColors.textSecondary)),
              const SizedBox(height: 12),
              Expanded(
                child: ListView(
                  children: [
                    _cityTile('New York, USA', 40.7128, -74.0060),
                    _cityTile('London, United Kingdom', 51.5074, -0.1278),
                    _cityTile('Tokyo, Japan', 35.6762, 139.6503),
                    _cityTile('Paris, France', 48.8566, 2.3522),
                    _cityTile('Sydney, Australia', -33.8688, 151.2093),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cityTile(String city, double lat, double lon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GlassContainer(
        onTap: () => controller.selectCity(city, lat, lon),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(city, style: AppTypography.body()),
            const Icon(Icons.location_on, color: AppColors.primary, size: 18),
          ],
        ),
      ),
    );
  }
}
