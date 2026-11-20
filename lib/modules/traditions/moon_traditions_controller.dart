import 'package:get/get.dart';
import '../../data/repositories/moon_repository.dart';
import '../../data/models/moon_tradition_model.dart';

class MoonTraditionsController extends GetxController {
  final MoonRepository _repository = Get.find<MoonRepository>();
  late List<MoonTraditionModel> traditions;

  @override
  void onInit() {
    super.onInit();
    traditions = _repository.getTraditions();
  }
}
