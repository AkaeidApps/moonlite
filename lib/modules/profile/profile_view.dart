import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/moonlight_header.dart';
import '../../shared/widgets/glass_container.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 110),
        children: [
          const MoonlightHeader(
            title: 'User Profile',
            subtitle: 'Account & Astronomy Preferences',
          ),
          const SizedBox(height: 24),
          GlassContainer(
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [AppColors.primary, AppColors.purple],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.4),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(Icons.person, color: AppColors.background, size: 36),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => Text(controller.userName.value, style: AppTypography.heading2())),
                      const SizedBox(height: 4),
                      Obx(() => Text(controller.userEmail.value, style: AppTypography.bodySmall(color: AppColors.textSecondary))),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.gold.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.gold.withOpacity(0.5)),
                        ),
                        child: Text('MOONLITE EXPLORER', style: AppTypography.bodySmall(color: AppColors.gold)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text('Account Options', style: AppTypography.heading3()),
          const SizedBox(height: 12),
          _profileTile(Icons.favorite, 'Saved Favorites', controller.goToFavorites),
          _profileTile(Icons.star, 'MOONLITE PRO Subscription', controller.goToPro),
          _profileTile(Icons.settings, 'Settings & Preferences', controller.goToSettings),
          _profileTile(Icons.help_outline, 'Help & Astronomy Guide', () {}),
          _profileTile(Icons.info_outline, 'About MOONLITE', () {}),
        ],
      ),
    );
  }

  Widget _profileTile(IconData icon, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GlassContainer(
        onTap: onTap,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary, size: 22),
            const SizedBox(width: 16),
            Expanded(child: Text(title, style: AppTypography.body())),
            const Icon(Icons.arrow_forward_ios, color: AppColors.textSecondary, size: 16),
          ],
        ),
      ),
    );
  }
}
