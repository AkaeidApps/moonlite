import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/global_moonlight_background.dart';
import '../../shared/widgets/moonlight_header.dart';
import '../../shared/widgets/glass_container.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';

class PhotographyPlannerView extends StatelessWidget {
  const PhotographyPlannerView({Key? key}) : super(key: key);

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
                title: 'Photo Planner',
                subtitle: 'Landscape Alignment & Moonrise',
                onBackPressed: () => Get.back(),
              ),
              const SizedBox(height: 24),
              GlassContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Moonrise & Golden Hour', style: AppTypography.heading3()),
                    const SizedBox(height: 12),
                    Text('Plan your landscape shots with precise lunar elevation and azimuth alignment.', style: AppTypography.body(color: AppColors.textSecondary)),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Moonrise Azimuth', style: AppTypography.body(color: AppColors.textSecondary)),
                        Text('68.4° East-Northeast', style: AppTypography.numbers()),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recommended Lens', style: AppTypography.body(color: AppColors.textSecondary)),
                        Text('200mm - 600mm Telephoto', style: AppTypography.numbers()),
                      ],
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
