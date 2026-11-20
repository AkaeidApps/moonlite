import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/global_moonlight_background.dart';
import '../../shared/widgets/moonlight_header.dart';
import '../../shared/widgets/glass_container.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

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
                title: 'Saved Favorites',
                subtitle: 'Bookmarked Phases & Events',
                onBackPressed: () => Get.back(),
              ),
              const SizedBox(height: 24),
              GlassContainer(
                child: Column(
                  children: [
                    const Icon(Icons.favorite, color: AppColors.eclipseRed, size: 48),
                    const SizedBox(height: 16),
                    Text('No saved favorites yet', style: AppTypography.heading3()),
                    const SizedBox(height: 8),
                    Text('Tap the heart icon on any lunar event or moon phase to save it here.', style: AppTypography.body(color: AppColors.textSecondary), textAlign: TextAlign.center),
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
