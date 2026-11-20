import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/moonlight_header.dart';
import '../../shared/widgets/glass_container.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import 'discover_controller.dart';

class DiscoverView extends GetView<DiscoverController> {
  const DiscoverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DiscoverController());

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 110),
        children: [
          const MoonlightHeader(
            title: 'Astronomy Hub',
            subtitle: 'Explore the Universe & Lunar Tools',
          ),
          const SizedBox(height: 16),
          _discoverTile(
            title: 'Luna AI Assistant',
            subtitle: 'Real-time intelligent lunar & astronomy guidance',
            icon: Icons.auto_awesome,
            color: AppColors.gold,
            onTap: controller.goToAiAssistant,
          ),
          _discoverTile(
            title: 'Moon Phase Explorer',
            subtitle: 'Interactive 3D Moon & 8 Major Phases',
            icon: Icons.nightlight,
            color: AppColors.primary,
            onTap: controller.goToExplorer,
          ),
          _discoverTile(
            title: 'Moon Compass',
            subtitle: 'Real-time device orientation & azimuth bearing',
            icon: Icons.explore,
            color: AppColors.purple,
            onTap: controller.goToCompass,
          ),
          _discoverTile(
            title: 'Moon Finder & AR',
            subtitle: 'Live camera preview & projected sky trajectory',
            icon: Icons.camera,
            color: AppColors.moonlight,
            onTap: controller.goToFinderAr,
          ),
          _discoverTile(
            title: 'Moon Position Map',
            subtitle: 'Interactive coordinates & time-based preview',
            icon: Icons.map,
            color: AppColors.primary,
            onTap: controller.goToPositionMap,
          ),
          _discoverTile(
            title: 'Eclipse Tracker',
            subtitle: 'Solar & Lunar eclipse schedules and visibility',
            icon: Icons.nightlight_round,
            color: AppColors.eclipseRed,
            onTap: controller.goToEclipse,
          ),
          _discoverTile(
            title: 'Moon Names & Traditions',
            subtitle: 'Wolf Moon, Snow Moon, Harvest Moon lore',
            icon: Icons.menu_book,
            color: AppColors.gold,
            onTap: controller.goToTraditions,
          ),
          _discoverTile(
            title: 'Astronomy Events',
            subtitle: 'Supermoons, meteor showers, and celestial alerts',
            icon: Icons.auto_awesome,
            color: AppColors.primary,
            onTap: controller.goToEvents,
          ),
          _discoverTile(
            title: 'Photography Planner',
            subtitle: 'Landscape alignment & moonrise planning',
            icon: Icons.camera_alt,
            color: AppColors.moonlight,
            onTap: controller.goToPhotography,
          ),
          _discoverTile(
            title: 'Weather & Visibility',
            subtitle: 'Cloud coverage, transparency & observation score',
            icon: Icons.cloud,
            color: AppColors.purple,
            onTap: controller.goToWeather,
          ),
          _discoverTile(
            title: 'Favorites',
            subtitle: 'Saved moon phases, events & observation dates',
            icon: Icons.favorite,
            color: AppColors.eclipseRed,
            onTap: controller.goToFavorites,
          ),
          _discoverTile(
            title: 'Home Screen Widgets',
            subtitle: 'Setup interactive widgets & countdowns',
            icon: Icons.widgets,
            color: AppColors.primary,
            onTap: controller.goToWidgets,
          ),
          _discoverTile(
            title: 'MOONLITE PRO',
            subtitle: 'Exclusive astronomy insights & advanced planning',
            icon: Icons.star,
            color: AppColors.gold,
            onTap: controller.goToPro,
          ),
        ],
      ),
    );
  }

  Widget _discoverTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GlassContainer(
        onTap: onTap,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTypography.heading3()),
                  const SizedBox(height: 4),
                  Text(subtitle, style: AppTypography.bodySmall(color: AppColors.textSecondary)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: AppColors.textSecondary, size: 16),
          ],
        ),
      ),
    );
  }
}
