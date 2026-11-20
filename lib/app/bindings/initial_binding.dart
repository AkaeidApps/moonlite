import 'package:get/get.dart';
import '../../services/location_service.dart';
import '../../services/notification_service.dart';
import '../../services/sensor_service.dart';
import '../../data/repositories/moon_repository.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LocationService>(LocationService(), permanent: true);
    Get.put<NotificationService>(NotificationService(), permanent: true);
    Get.put<SensorService>(SensorService(), permanent: true);
    Get.put<MoonRepository>(MoonRepository(), permanent: true);
  }
}
