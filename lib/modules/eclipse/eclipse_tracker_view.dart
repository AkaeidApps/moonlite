import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/global_moonlight_background.dart';
import '../../shared/widgets/moonlight_header.dart';
import '../../shared/widgets/glass_container.dart';
import '../../data/repositories/moon_repository.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';

class EclipseTrackerView extends StatelessWidget {
  const EclipseTrackerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = Get.find<MoonRepository>();
    final eclipses = repository.getEclipses();

    return GlobalMoonlightBackground(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              MoonlightHeader(
                title: 'Eclipse Tracker',
                subtitle: 'Solar & Lunar Eclipse Schedules',
                onBackPressed: () => Get.back(),
              ),
              const SizedBox(height: 24),
              ...eclipses.map((eclipse) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: GlassContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(eclipse.title, style: AppTypography.heading2(color: AppColors.eclipseRed)),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.eclipseRed.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(eclipse.type, style: AppTypography.bodySmall(color: AppColors.eclipseRed)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(eclipse.description, style: AppTypography.body(color: AppColors.textSecondary)),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Visibility: ${eclipse.visibility}', style: AppTypography.bodySmall(color: AppColors.primary)),
                              Text('Duration: ${eclipse.duration}', style: AppTypography.bodySmall(color: AppColors.moonlight)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
