import 'package:get/get.dart';
import '../../app/routes/app_routes.dart';
import '../../services/location_service.dart';

class SplashController extends GetxController {
  bool _navigated = false;

  @override
  void onReady() {
    super.onReady();
    _navigateToNext();
  }

  void _navigateToNext() async {
    // Wait minimum splash duration
    await Future.delayed(const Duration(milliseconds: 2000));

    if (_navigated) return;
    _navigated = true;

    // Fetch location with a timeout — never block navigation
    try {
      final locationService = Get.find<LocationService>();
      await locationService.determinePosition().timeout(
        const Duration(seconds: 5),
        onTimeout: () {/* Use default location silently */},
      );
    } catch (_) {
      // Ignore any location error — app continues with defaults
    }

    Get.offAllNamed(AppRoutes.onboarding);
  }

  void onSplashTap() async {
    if (_navigated) return;
    _navigated = true;

    try {
      final locationService = Get.find<LocationService>();
      await locationService.determinePosition().timeout(
        const Duration(seconds: 3),
        onTimeout: () {},
      );
    } catch (_) {}

    Get.offAllNamed(AppRoutes.onboarding);
  }
}
