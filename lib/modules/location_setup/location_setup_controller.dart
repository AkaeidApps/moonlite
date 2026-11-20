import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/routes/app_routes.dart';
import '../../services/location_service.dart';

class LocationSetupController extends GetxController {
  final LocationService locationService = Get.find<LocationService>();
  final TextEditingController searchController = TextEditingController();

  var isLoading = false.obs;

  void detectLocation() async {
    isLoading.value = true;
    await locationService.determinePosition();
    isLoading.value = false;
    Get.offAllNamed(AppRoutes.mainShell);
  }

  void selectCity(String city, double lat, double lon) {
    locationService.setManualLocation(city, lat, lon);
    Get.offAllNamed(AppRoutes.mainShell);
  }
}
