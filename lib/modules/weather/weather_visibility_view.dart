import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/global_moonlight_background.dart';
import '../../shared/widgets/moonlight_header.dart';
import '../../shared/widgets/glass_container.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';

class WeatherVisibilityView extends StatelessWidget {
  const WeatherVisibilityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalMoonlightBackground(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              MoonlightHeader(
                title: 'Weather & Visibility',
                subtitle: 'Cloud Coverage & Sky Transparency',
                onBackPressed: () => Get.back(),
              ),
              const SizedBox(height: 24),
              GlassContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Observation Score', style: AppTypography.heading3()),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text('92% Excellent', style: AppTypography.bodySmall(color: AppColors.primary)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _weatherRow('Cloud Coverage', '4% (Clear Sky)'),
                    _weatherRow('Atmospheric Transparency', 'High (18 km visibility)'),
                    _weatherRow('Humidity', '42%'),
                    _weatherRow('Wind Speed', '6 km/h NW'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _weatherRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.body(color: AppColors.textSecondary)),
          Text(value, style: AppTypography.numbers()),
        ],
      ),
    );
  }
}
