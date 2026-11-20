import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/global_moonlight_background.dart';
import '../../shared/widgets/moonlight_header.dart';
import '../../shared/widgets/glass_container.dart';
import '../../services/notification_service.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notificationService = Get.find<NotificationService>();

    return GlobalMoonlightBackground(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              MoonlightHeader(
                title: 'Notifications',
                subtitle: 'Lunar Alerts & Reminders',
                onBackPressed: () => Get.back(),
              ),
              const SizedBox(height: 24),
              GlassContainer(
                child: Column(
                  children: [
                    Obx(() => SwitchListTile(
                          title: Text('Enable Notifications', style: AppTypography.heading3()),
                          subtitle: Text('Receive alerts for celestial events', style: AppTypography.bodySmall(color: AppColors.textSecondary)),
                          value: notificationService.notificationsEnabled.value,
                          activeColor: AppColors.primary,
                          onChanged: notificationService.toggleNotifications,
                        )),
                    const Divider(color: AppColors.cardBorder, height: 24),
                    Obx(() => SwitchListTile(
                          title: Text('Full Moon Alerts', style: AppTypography.body()),
                          value: notificationService.fullMoonAlerts.value,
                          activeColor: AppColors.primary,
                          onChanged: notificationService.toggleFullMoon,
                        )),
                    Obx(() => SwitchListTile(
                          title: Text('New Moon Alerts', style: AppTypography.body()),
                          value: notificationService.newMoonAlerts.value,
                          activeColor: AppColors.primary,
                          onChanged: notificationService.toggleNewMoon,
                        )),
                    Obx(() => SwitchListTile(
                          title: Text('Eclipse Reminders', style: AppTypography.body()),
                          value: notificationService.eclipseReminders.value,
                          activeColor: AppColors.primary,
                          onChanged: notificationService.toggleEclipse,
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
