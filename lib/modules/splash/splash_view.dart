import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/global_moonlight_background.dart';
import '../../shared/widgets/animated_moon_widget.dart';
import '../../theme/app_typography.dart';
import '../../theme/app_colors.dart';
import 'splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Register controller here (not in GetView) to avoid double-put issues
    final controller = Get.put(SplashController());

    return GlobalMoonlightBackground(
      child: GestureDetector(
        onTap: controller.onSplashTap,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AnimatedMoonWidget(phase: 0.5, size: 200),
              const SizedBox(height: 36),
              Text(
                'MOONLITE',
                style: AppTypography.astronomic(color: AppColors.textPrimary, fontSize: 36),
              ),
              const SizedBox(height: 12),
              Text(
                'Discover the Moon. Explore the Night.',
                style: AppTypography.bodySmall(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 8),
              Text(
                '(Tap anywhere to enter)',
                style: AppTypography.bodySmall(color: AppColors.primary.withOpacity(0.7)),
              ),
              const SizedBox(height: 36),
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                  strokeWidth: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
