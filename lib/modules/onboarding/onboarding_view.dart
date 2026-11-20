import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/global_moonlight_background.dart';
import '../../shared/widgets/animated_moon_widget.dart';
import '../../shared/widgets/premium_button.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import 'onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());

    final titles = [
      'Discover the Moon',
      'Explore Lunar Events',
      'Find the Moon in the Sky',
    ];

    final descriptions = [
      'Experience high-precision lunar phases, illumination, age, and nocturnal astronomy data in cinematic luxury.',
      'Track upcoming supermoons, eclipses, meteor showers, and ancient cultural traditions.',
      'Use interactive compass and AR camera view to precisely locate the moon in the night sky.',
    ];

    final phases = [0.25, 0.5, 0.75];

    return GlobalMoonlightBackground(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: controller.skip,
                    child: Text('Skip', style: AppTypography.body(color: AppColors.textSecondary)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedMoonWidget(phase: phases[index], size: 220),
                        const SizedBox(height: 48),
                        Text(
                          titles[index],
                          style: AppTypography.heading1(),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          descriptions[index],
                          style: AppTypography.body(color: AppColors.textSecondary),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Row(
                        children: List.generate(
                          3,
                          (index) => Container(
                            margin: const EdgeInsets.only(right: 6),
                            width: controller.currentPage.value == index ? 24 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: controller.currentPage.value == index
                                  ? AppColors.primary
                                  : AppColors.surfaceLight,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      )),
                  PremiumButton(
                    text: 'Next',
                    onPressed: controller.nextPage,
                    icon: Icons.arrow_forward,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
