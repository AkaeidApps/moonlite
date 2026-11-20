import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/global_moonlight_background.dart';
import '../../shared/widgets/moon_navigation_bar.dart';
import '../home/home_view.dart';
import '../calendar/calendar_view.dart';
import '../discover/discover_view.dart';
import '../compass/moon_compass_view.dart';
import '../profile/profile_view.dart';
import 'main_shell_controller.dart';

class MainShellView extends GetView<MainShellController> {
  const MainShellView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainShellController());

    final screens = [
      const HomeView(),
      const CalendarView(),
      const DiscoverView(),
      const MoonCompassView(),
      const ProfileView(),
    ];

    return GlobalMoonlightBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Obx(() => IndexedStack(
                  index: controller.currentIndex.value,
                  children: screens,
                )),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Obx(() => MoonNavigationBar(
                    currentIndex: controller.currentIndex.value,
                    onTap: controller.changeTab,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
