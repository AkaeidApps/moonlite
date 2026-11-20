import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/global_moonlight_background.dart';
import '../../shared/widgets/moonlight_header.dart';
import '../../shared/widgets/glass_container.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

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
                title: 'Settings',
                subtitle: 'Preferences & Configuration',
                onBackPressed: () => Get.back(),
              ),
              const SizedBox(height: 24),
              GlassContainer(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Time Format', style: AppTypography.body()),
                      trailing: Text('24-Hour', style: AppTypography.numbers(color: AppColors.primary)),
                      onTap: () {},
                    ),
                    const Divider(color: AppColors.cardBorder),
                    ListTile(
                      title: Text('Measurement Units', style: AppTypography.body()),
                      trailing: Text('Metric (°C, km)', style: AppTypography.numbers(color: AppColors.primary)),
                      onTap: () {},
                    ),
                    const Divider(color: AppColors.cardBorder),
                    ListTile(
                      title: Text('Language', style: AppTypography.body()),
                      trailing: Text('English', style: AppTypography.numbers(color: AppColors.primary)),
                      onTap: () {},
                    ),
                    const Divider(color: AppColors.cardBorder),
                    ListTile(
                      title: Text('Privacy Policy', style: AppTypography.body()),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.textSecondary),
                      onTap: () {},
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
