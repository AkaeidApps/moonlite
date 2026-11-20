import 'package:get/get.dart';
import '../../app/routes/app_routes.dart';

class ProfileController extends GetxController {
  var userName = 'Astronomy Enthusiast'.obs;
  var userEmail = 'explorer@moonlite.space'.obs;
  var isPro = false.obs;

  void goToSettings() => Get.toNamed(AppRoutes.settings);
  void goToFavorites() => Get.toNamed(AppRoutes.favorites);
  void goToPro() => Get.toNamed(AppRoutes.moonlitePro);
}
