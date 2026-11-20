import 'package:get/get.dart';

class NotificationService extends GetxService {
  var notificationsEnabled = true.obs;
  var fullMoonAlerts = true.obs;
  var newMoonAlerts = true.obs;
  var eclipseReminders = true.obs;

  void toggleNotifications(bool value) {
    notificationsEnabled.value = value;
  }

  void toggleFullMoon(bool value) {
    fullMoonAlerts.value = value;
  }

  void toggleNewMoon(bool value) {
    newMoonAlerts.value = value;
  }

  void toggleEclipse(bool value) {
    eclipseReminders.value = value;
  }
}
