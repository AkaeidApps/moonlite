import 'package:get/get.dart';
import '../../data/repositories/moon_repository.dart';
import '../../data/models/moon_data_model.dart';
import '../../data/models/lunar_event_model.dart';
import '../../services/location_service.dart';
import '../../app/routes/app_routes.dart';

class HomeController extends GetxController {
  final MoonRepository _moonRepository = Get.find<MoonRepository>();
  final LocationService _locationService = Get.find<LocationService>();

  var moonData = Rxn<MoonDataModel>();
  var upcomingEvents = <LunarEventModel>[].obs;
  var selectedDate = DateTime.now().obs;
  var isRefreshing = false.obs;

  @override
  void onInit() {
    super.onInit();

    // Fetch initial data
    fetchData();

    // ── React to location changes in real-time ──────────────────────
    // Whenever latitude or longitude changes (user moved / manual set),
    // automatically re-compute moon data for the new coordinates.
    ever(_locationService.latitude, (_) => fetchData());
    ever(_locationService.longitude, (_) => fetchData());
  }

  void fetchData() {
    isRefreshing.value = true;
    final lat = _locationService.latitude.value;
    final lon = _locationService.longitude.value;
    moonData.value = _moonRepository.getMoonDataForDate(selectedDate.value, lat, lon);
    upcomingEvents.value = _moonRepository.getUpcomingEvents();
    isRefreshing.value = false;
  }

  /// Called when user picks a different date from the calendar
  void onDateChanged(DateTime date) {
    selectedDate.value = date;
    fetchData();
  }

  /// Refresh location then re-fetch moon data
  Future<void> refreshLocation() async {
    isRefreshing.value = true;
    try {
      await _locationService.determinePosition().timeout(
        const Duration(seconds: 8),
        onTimeout: () {},
      );
    } catch (_) {}
    fetchData(); // ever() will also trigger, but explicit call is safe
  }

  void goToExplorer() => Get.toNamed(AppRoutes.moonExplorer);
  void goToEclipse() => Get.toNamed(AppRoutes.eclipseTracker);
  void goToPhotography() => Get.toNamed(AppRoutes.photographyPlanner);
  void goToWeather() => Get.toNamed(AppRoutes.weatherVisibility);
  void goToPro() => Get.toNamed(AppRoutes.moonlitePro);
}
