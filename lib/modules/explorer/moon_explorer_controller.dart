import 'package:get/get.dart';
import '../../core/utils/astronomy_calculator.dart';

class MoonExplorerController extends GetxController {
  var currentPhase = 0.5.obs; // 0.0 to 1.0

  void setPhase(double value) {
    currentPhase.value = value;
  }
}
