import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/global_moonlight_background.dart';
import '../../shared/widgets/moonlight_header.dart';
import '../../shared/widgets/animated_moon_widget.dart';
import '../../shared/widgets/glass_container.dart';
import '../../core/utils/astronomy_calculator.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import 'moon_explorer_controller.dart';

class MoonExplorerView extends GetView<MoonExplorerController> {
  const MoonExplorerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MoonExplorerController());

    return GlobalMoonlightBackground(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              MoonlightHeader(
                title: 'Phase Explorer',
                subtitle: 'Interactive Lunar Phases',
                onBackPressed: () => Get.back(),
              ),
              const SizedBox(height: 24),
              Center(
                child: Obx(() => AnimatedMoonWidget(
                      phase: controller.currentPhase.value,
                      size: 220,
                    )),
              ),
              const SizedBox(height: 32),
              GlassContainer(
                child: Column(
                  children: [
                    Obx(() {
                      final phase = controller.currentPhase.value;
                      final name = AstronomyCalculator.getPhaseName(phase);
                      final illumination = AstronomyCalculator.getIllumination(phase);
                      final age = AstronomyCalculator.getMoonAge(phase);

                      return Column(
                        children: [
                          Text(name, style: AppTypography.heading1()),
                          const SizedBox(height: 8),
                          Text(
                            'Illumination: ${illumination.toStringAsFixed(1)}% • Age: ${age.toStringAsFixed(1)} days',
                            style: AppTypography.body(color: AppColors.textSecondary),
                          ),
                        ],
                      );
                    }),
                    const SizedBox(height: 24),
                    Text('Drag to change lunar phase', style: AppTypography.bodySmall(color: AppColors.primary)),
                    const SizedBox(height: 12),
                    Obx(() => Slider(
                          value: controller.currentPhase.value,
                          min: 0.0,
                          max: 1.0,
                          activeColor: AppColors.primary,
                          inactiveColor: AppColors.surfaceLight,
                          onChanged: controller.setPhase,
                        )),
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
