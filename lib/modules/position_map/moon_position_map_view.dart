import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/global_moonlight_background.dart';
import '../../shared/widgets/moonlight_header.dart';
import '../../shared/widgets/glass_container.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';

class MoonPositionMapView extends StatelessWidget {
  const MoonPositionMapView({Key? key}) : super(key: key);

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
                title: 'Moon Position Map',
                subtitle: 'Trajectory & Azimuth Planner',
                onBackPressed: () => Get.back(),
              ),
              const SizedBox(height: 24),
              GlassContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Celestia Coordinate Grid', style: AppTypography.heading3()),
                    const SizedBox(height: 16),
                    Container(
                      height: 240,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundSecondary,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.cardBorder),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.map_outlined, color: AppColors.primary, size: 48),
                            const SizedBox(height: 12),
                            Text('Interactive Moon Position Grid', style: AppTypography.body(color: AppColors.textPrimary)),
                            const SizedBox(height: 4),
                            Text('Tracking Lunar Azimuth & Elevation', style: AppTypography.bodySmall(color: AppColors.textSecondary)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
