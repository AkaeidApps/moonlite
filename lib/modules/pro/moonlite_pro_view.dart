import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/global_moonlight_background.dart';
import '../../shared/widgets/moonlight_header.dart';
import '../../shared/widgets/glass_container.dart';
import '../../shared/widgets/premium_button.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';

class MoonliteProView extends StatelessWidget {
  const MoonliteProView({Key? key}) : super(key: key);

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
                title: 'MOONLITE PRO',
                subtitle: 'Unlock Ultimate Astronomy Insights',
                onBackPressed: () => Get.back(),
              ),
              const SizedBox(height: 24),
              GlassContainer(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Icon(Icons.star, color: AppColors.gold, size: 56),
                    const SizedBox(height: 16),
                    Text('Experience the Cosmos', style: AppTypography.heading1()),
                    const SizedBox(height: 8),
                    Text(
                      'Get advanced eclipse planning, real-time weather forecasts, extended lunar calendars, and exclusive widgets.',
                      style: AppTypography.body(color: AppColors.textSecondary),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    _proFeature('Advanced Eclipse Simulation & Visibility Maps'),
                    _proFeature('High-Precision Moon Photography Planner'),
                    _proFeature('Atmospheric Transparency & Cloud Coverage Forecasts'),
                    _proFeature('Extended 10-Year Lunar Calendar & Ephemeris'),
                    const SizedBox(height: 36),
                    PremiumButton(
                      text: 'Upgrade to PRO • \$19.99 / Year',
                      onPressed: () {
                        Get.snackbar(
                          'MOONLITE PRO',
                          'Subscription simulated successfully!',
                          backgroundColor: AppColors.surface,
                          colorText: AppColors.textPrimary,
                        );
                      },
                      icon: Icons.star,
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

  Widget _proFeature(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: AppColors.gold, size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: AppTypography.body())),
        ],
      ),
    );
  }
}
