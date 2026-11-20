import 'package:get/get.dart';
import '../../data/repositories/moon_repository.dart';
import '../../data/models/moon_data_model.dart';
import '../../services/location_service.dart';

class CalendarController extends GetxController {
  final MoonRepository _moonRepository = Get.find<MoonRepository>();
  final LocationService _locationService = Get.find<LocationService>();

  var selectedDate = DateTime.now().obs;
  var moonData = Rxn<MoonDataModel>();

  @override
  void onInit() {
    super.onInit();
    updateDate(DateTime.now());
  }

  void updateDate(DateTime date) {
    selectedDate.value = date;
    moonData.value = _moonRepository.getMoonDataForDate(
      date,
      _locationService.latitude.value,
      _locationService.longitude.value,
    );
  }
}
