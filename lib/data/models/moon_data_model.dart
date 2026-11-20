class MoonDataModel {
  final DateTime date;
  final double phase; // 0.0 to 1.0
  final String phaseName;
  final double illumination; // 0 to 100
  final double age; // days
  final String moonrise;
  final String moonset;
  final double altitude;
  final double azimuth;

  MoonDataModel({
    required this.date,
    required this.phase,
    required this.phaseName,
    required this.illumination,
    required this.age,
    required this.moonrise,
    required this.moonset,
    required this.altitude,
    required this.azimuth,
  });
}
