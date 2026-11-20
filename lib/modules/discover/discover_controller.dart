import 'package:get/get.dart';
import '../../app/routes/app_routes.dart';

class DiscoverController extends GetxController {
  void goToAiAssistant() => Get.toNamed(AppRoutes.aiAssistant);
  void goToExplorer() => Get.toNamed(AppRoutes.moonExplorer);
  void goToCompass() => Get.toNamed(AppRoutes.moonCompass);
  void goToFinderAr() => Get.toNamed(AppRoutes.moonFinderAr);
  void goToPositionMap() => Get.toNamed(AppRoutes.moonPositionMap);
  void goToEclipse() => Get.toNamed(AppRoutes.eclipseTracker);
  void goToTraditions() => Get.toNamed(AppRoutes.moonTraditions);
  void goToEvents() => Get.toNamed(AppRoutes.astronomyEvents);
  void goToPhotography() => Get.toNamed(AppRoutes.photographyPlanner);
  void goToWeather() => Get.toNamed(AppRoutes.weatherVisibility);
  void goToFavorites() => Get.toNamed(AppRoutes.favorites);
  void goToWidgets() => Get.toNamed(AppRoutes.widgetsSetup);
  void goToPro() => Get.toNamed(AppRoutes.moonlitePro);
}
