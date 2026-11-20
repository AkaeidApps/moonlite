class PhotographyPlanModel {
  final String locationName;
  final DateTime date;
  final String moonriseTime;
  final String moonsetTime;
  final double azimuth;
  final String notes;

  PhotographyPlanModel({
    required this.locationName,
    required this.date,
    required this.moonriseTime,
    required this.moonsetTime,
    required this.azimuth,
    required this.notes,
  });
}
