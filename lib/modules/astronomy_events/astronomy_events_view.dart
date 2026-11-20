import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/global_moonlight_background.dart';
import '../../shared/widgets/moonlight_header.dart';
import '../../shared/widgets/glass_container.dart';
import '../../data/repositories/moon_repository.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';

class AstronomyEventsView extends StatelessWidget {
  const AstronomyEventsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = Get.find<MoonRepository>();
    final events = repository.getUpcomingEvents();

    return GlobalMoonlightBackground(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              MoonlightHeader(
                title: 'Astronomy Events',
                subtitle: 'Supermoons, Eclipses & Meteor Showers',
                onBackPressed: () => Get.back(),
              ),
              const SizedBox(height: 24),
              ...events.map((event) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: GlassContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(event.title, style: AppTypography.heading2(color: AppColors.primary)),
                              Text('In ${event.daysUntil} days', style: AppTypography.bodySmall(color: AppColors.gold)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(event.description, style: AppTypography.body(color: AppColors.textSecondary)),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Icon(Icons.category, color: AppColors.purple, size: 16),
                              const SizedBox(width: 6),
                              Text('Category: ${event.category}', style: AppTypography.bodySmall(color: AppColors.moonlight)),
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
