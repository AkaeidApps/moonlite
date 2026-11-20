import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/global_moonlight_background.dart';
import '../../shared/widgets/moonlight_header.dart';
import '../../shared/widgets/glass_container.dart';
import '../../data/models/moon_tradition_model.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';

class MoonTraditionDetailView extends StatelessWidget {
  const MoonTraditionDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MoonTraditionModel tradition = Get.arguments ?? MoonTraditionModel(
      name: 'Wolf Moon',
      month: 'January',
      subtitle: 'The Cold Midnight Howl',
      description: 'Named after packs of wolves howling hungrily outside Native American villages.',
      history: 'Originating from Algonquian and European folklore.',
      culturalMeaning: 'Symbolizes spiritual awakening.',
      traditions: 'Lighting hearth fires and setting intentions.',
    );

    return GlobalMoonlightBackground(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              MoonlightHeader(
                title: tradition.name,
                subtitle: tradition.month,
                onBackPressed: () => Get.back(),
              ),
              const SizedBox(height: 24),
              GlassContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tradition.subtitle, style: AppTypography.heading2(color: AppColors.gold)),
                    const SizedBox(height: 16),
                    Text('Description', style: AppTypography.heading3(color: AppColors.primary)),
                    const SizedBox(height: 6),
                    Text(tradition.description, style: AppTypography.body()),
                    const SizedBox(height: 20),
                    Text('History & Folklore', style: AppTypography.heading3(color: AppColors.primary)),
                    const SizedBox(height: 6),
                    Text(tradition.history, style: AppTypography.body()),
                    const SizedBox(height: 20),
                    Text('Cultural Meaning', style: AppTypography.heading3(color: AppColors.primary)),
                    const SizedBox(height: 6),
                    Text(tradition.culturalMeaning, style: AppTypography.body()),
                    const SizedBox(height: 20),
                    Text('Traditional Practices', style: AppTypography.heading3(color: AppColors.primary)),
                    const SizedBox(height: 6),
                    Text(tradition.traditions, style: AppTypography.body()),
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
