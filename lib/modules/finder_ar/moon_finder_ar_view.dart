import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/global_moonlight_background.dart';
import '../../shared/widgets/moonlight_header.dart';
import '../../shared/widgets/glass_container.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';

class MoonFinderArView extends StatelessWidget {
  const MoonFinderArView({Key? key}) : super(key: key);

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
                title: 'Moon Finder & AR',
                subtitle: 'Live Camera & Sky Trajectory',
                onBackPressed: () => Get.back(),
              ),
              const SizedBox(height: 24),
              GlassContainer(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    const Icon(Icons.camera, color: AppColors.primary, size: 64),
                    const SizedBox(height: 20),
                    Text('AR Sky Compass Active', style: AppTypography.heading2()),
                    const SizedBox(height: 12),
                    Text(
                      'Point your device toward the southern night sky to align with the Moon trajectory marker.',
                      style: AppTypography.body(color: AppColors.textSecondary),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundSecondary,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.cardBorder),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const Icon(Icons.nightlight_round, color: AppColors.primary, size: 48),
                          Positioned(
                            bottom: 16,
                            child: Text('Altitude: 42.5° • Azimuth: 185.0°', style: AppTypography.bodySmall(color: AppColors.primary)),
                          ),
                        ],
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
