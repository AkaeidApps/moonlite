import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationService extends GetxService {
  final currentCity = 'New York, USA'.obs;
  final latitude = 40.7128.obs;
  final longitude = (-74.0060).obs;

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition();

    latitude.value = position.latitude;
    longitude.value = position.longitude;
    currentCity.value = 'Current Location (${position.latitude.toStringAsFixed(1)}°, ${position.longitude.toStringAsFixed(1)}°)';
  }

  void setManualLocation(String city, double lat, double lon) {
    currentCity.value = city;
    latitude.value = lat;
    longitude.value = lon;
  }
}
