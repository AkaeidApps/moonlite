import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/glass_container.dart';
import '../../shared/widgets/animated_moon_widget.dart';
import '../../shared/widgets/moon_info_card.dart';
import '../../shared/widgets/moon_countdown_widget.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../services/location_service.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final locationService = Get.find<LocationService>();

    return SafeArea(
      child: Obx(() {
        final data = controller.moonData.value;
        if (data == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          color: AppColors.primary,
          backgroundColor: AppColors.surface,
          onRefresh: () => controller.refreshLocation(),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 110),
            children: [
              // ── Top Bar ──────────────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MOONLITE',
                          style: AppTypography.astronomic(
                              fontSize: 20, color: AppColors.primary),
                        ),
                        const SizedBox(height: 4),
                        // ── Reactive location display ─────────────────
                        Obx(() => GestureDetector(
                              onTap: () => controller.refreshLocation(),
                              child: Row(
                                children: [
                                  controller.isRefreshing.value
                                      ? const SizedBox(
                                          width: 10,
                                          height: 10,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 1.5,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    AppColors.primary),
                                          ),
                                        )
                                      : const Icon(Icons.location_on,
                                          color: AppColors.primary, size: 12),
                                  const SizedBox(width: 4),
                                  Flexible(
                                    child: Text(
                                      locationService.currentCity.value,
                                      style: AppTypography.bodySmall(
                                          color: AppColors.textSecondary),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(Icons.refresh,
                                      color: AppColors.textSecondary, size: 11),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon:
                            const Icon(Icons.star, color: AppColors.gold, size: 24),
                        onPressed: controller.goToPro,
                      ),
                      IconButton(
                        icon: const Icon(Icons.notifications_none,
                            color: AppColors.moonlight),
                        onPressed: () => Get.toNamed('/notifications'),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // ── Hero Moon Card ────────────────────────────────────────
              GlassContainer(
                onTap: controller.goToExplorer,
                padding:
                    const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
                child: Column(
                  children: [
                    // Moon image — phase & location-driven
                    AnimatedMoonWidget(phase: data.phase, size: 210),
                    const SizedBox(height: 24),
                    Text(data.phaseName, style: AppTypography.heading1()),
                    const SizedBox(height: 8),
                    Text(
                      '${data.illumination.toStringAsFixed(1)}% Illuminated  •  Age: ${data.age.toStringAsFixed(1)} days',
                      style: AppTypography.body(color: AppColors.textSecondary),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    // Coordinates subtitle
                    Obx(() => Text(
                          '${locationService.latitude.value.toStringAsFixed(2)}°, '
                          '${locationService.longitude.value.toStringAsFixed(2)}°',
                          style: AppTypography.bodySmall(
                              color: AppColors.primary.withOpacity(0.7)),
                        )),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.explore,
                            color: AppColors.primary, size: 16),
                        const SizedBox(width: 6),
                        Text(
                          'Tap to explore interactive phases',
                          style: AppTypography.bodySmall(
                              color: AppColors.primary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // ── Countdown Widget ──────────────────────────────────────
              const MoonCountdownWidget(
                eventName: 'SUPER MOON',
                days: 4,
                hours: 12,
                minutes: 45,
              ),
              const SizedBox(height: 20),

              // ── Lunar Ephemeris Grid ──────────────────────────────────
              Text('Lunar Ephemeris', style: AppTypography.heading3()),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.5,
                children: [
                  MoonInfoCard(
                    title: 'Moonrise',
                    value: data.moonrise,
                    icon: Icons.wb_twilight,
                    subtitle: 'Eastern Horizon',
                  ),
                  MoonInfoCard(
                    title: 'Moonset',
                    value: data.moonset,
                    icon: Icons.nights_stay,
                    subtitle: 'Western Horizon',
                  ),
                  MoonInfoCard(
                    title: 'Altitude',
                    value: '${data.altitude.toStringAsFixed(1)}°',
                    icon: Icons.height,
                    subtitle: 'Above Horizon',
                  ),
                  MoonInfoCard(
                    title: 'Azimuth',
                    value: '${data.azimuth.toStringAsFixed(1)}°',
                    icon: Icons.navigation,
                    subtitle: 'Compass Bearing',
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // ── Quick Access Tools ────────────────────────────────────
              Text('Quick Exploration', style: AppTypography.heading3()),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: GlassContainer(
                      onTap: controller.goToEclipse,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.nights_stay,
                              color: AppColors.eclipseRed, size: 28),
                          const SizedBox(height: 12),
                          Text('Eclipse Tracker',
                              style: AppTypography.heading3()),
                          const SizedBox(height: 4),
                          Text('Next Blood Moon',
                              style: AppTypography.bodySmall(
                                  color: AppColors.textSecondary)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GlassContainer(
                      onTap: controller.goToPhotography,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.camera_alt,
                              color: AppColors.primary, size: 28),
                          const SizedBox(height: 12),
                          Text('Photo Planner',
                              style: AppTypography.heading3()),
                          const SizedBox(height: 4),
                          Text('Landscape Alignment',
                              style: AppTypography.bodySmall(
                                  color: AppColors.textSecondary)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
