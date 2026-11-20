import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorService extends GetxService {
  var heading = 0.0.obs;
  StreamSubscription? _magnetometerSubscription;

  @override
  void onInit() {
    super.onInit();
    startListening();
  }

  void startListening() {
    _magnetometerSubscription = magnetometerEventStream().listen((MagnetometerEvent event) {
      double angle = atan2(event.y, event.x) * (180 / pi);
      if (angle < 0) angle += 360;
      heading.value = angle;
    });
  }

  @override
  void onClose() {
    _magnetometerSubscription?.cancel();
    super.onClose();
  }
}
