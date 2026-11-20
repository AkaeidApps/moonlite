import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/global_moonlight_background.dart';
import '../../shared/widgets/moonlight_header.dart';
import '../../shared/widgets/glass_container.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';

class WidgetsSetupView extends StatelessWidget {
  const WidgetsSetupView({Key? key}) : super(key: key);

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
                title: 'Home Screen Widgets',
                subtitle: 'Moon Phase & Countdown Widgets',
                onBackPressed: () => Get.back(),
              ),
              const SizedBox(height: 24),
              GlassContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Available Widgets', style: AppTypography.heading3()),
                    const SizedBox(height: 16),
                    _widgetTile('Moon Phase Widget', 'Displays live 3D phase illustration & illumination percentage.'),
                    const SizedBox(height: 12),
                    _widgetTile('Full Moon Countdown', 'Live countdown timer to the next major lunar phase.'),
                    const SizedBox(height: 12),
                    _widgetTile('Moonrise & Moonset', 'Quick view of daily twilight and ephemeris times.'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _widgetTile(String title, String desc) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTypography.heading3(color: AppColors.primary)),
          const SizedBox(height: 4),
          Text(desc, style: AppTypography.bodySmall(color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}
