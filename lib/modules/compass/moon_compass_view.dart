import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/moonlight_header.dart';
import '../../shared/widgets/glass_container.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import 'moon_compass_controller.dart';

class MoonCompassView extends GetView<MoonCompassController> {
  const MoonCompassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MoonCompassController());

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 110),
        children: [
          const MoonlightHeader(
            title: 'Moon Compass',
            subtitle: 'Real-time orientation & Moon bearing',
          ),
          const SizedBox(height: 24),
          Center(
            child: Obx(() {
              final heading = controller.sensorService.heading.value;
              return Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.surface.withOpacity(0.6),
                  border: Border.all(color: AppColors.primary.withOpacity(0.4), width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.2),
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Compass directions
                    Transform.rotate(
                      angle: -heading * pi / 180,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const Positioned(top: 16, child: Text('N', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 18))),
                          const Positioned(bottom: 16, child: Text('S', style: TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.bold, fontSize: 18))),
                          const Positioned(left: 16, child: Text('W', style: TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.bold, fontSize: 18))),
                          const Positioned(right: 16, child: Text('E', style: TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.bold, fontSize: 18))),
                          // Moon indicator on compass circle
                          Positioned(
                            top: 40,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                              child: const Icon(Icons.nightlight_round, color: AppColors.background, size: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${heading.toStringAsFixed(1)}°', style: AppTypography.astronomic(fontSize: 40)),
                        const SizedBox(height: 4),
                        Text('Heading', style: AppTypography.bodySmall(color: AppColors.textSecondary)),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
          const SizedBox(height: 36),
          GlassContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Calibration & Sensor Tips', style: AppTypography.heading3()),
                const SizedBox(height: 12),
                Text('• Rotate your device in a figure-8 motion to calibrate the magnetometer.\n• Keep away from strong magnetic or metallic interference.', style: AppTypography.body(color: AppColors.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
