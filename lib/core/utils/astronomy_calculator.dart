import 'dart:math';

class AstronomyCalculator {
  // Synodic month in days
  static const double synodicMonth = 29.53058867;

  // Known New Moon reference date (e.g. Jan 11, 2024 11:57 UTC)
  static final DateTime referenceNewMoon = DateTime.utc(2024, 1, 11, 11, 57);

  /// Calculate lunar phase value between 0.0 and 1.0 for a given date
  static double getMoonPhase(DateTime date) {
    final difference = date.toUtc().difference(referenceNewMoon).inMinutes;
    final totalDays = difference / (24 * 60);
    final cycles = totalDays / synodicMonth;
    double phase = cycles - cycles.floor();
    if (phase < 0) phase += 1.0;
    return phase;
  }

  /// Get Moon Illumination percentage (0 to 100)
  static double getIllumination(double phase) {
    return ((1 - cos(2 * pi * phase)) / 2) * 100;
  }

  /// Get Moon Age in days (0 to ~29.53)
  static double getMoonAge(double phase) {
    return phase * synodicMonth;
  }

  /// Get Moon Phase Name
  static String getPhaseName(double phase) {
    if (phase < 0.03 || phase > 0.97) return 'New Moon';
    if (phase < 0.22) return 'Waxing Crescent';
    if (phase < 0.28) return 'First Quarter';
    if (phase < 0.47) return 'Waxing Gibbous';
    if (phase < 0.53) return 'Full Moon';
    if (phase < 0.72) return 'Waning Gibbous';
    if (phase < 0.78) return 'Last Quarter';
    return 'Waning Crescent';
  }

  /// Estimated Moonrise time
  static String getMoonriseTime(double phase) {
    int hour = (6 + (phase * 24)).toInt() % 24;
    int minute = ((phase * 24 * 60) % 60).toInt();
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  /// Estimated Moonset time
  static String getMoonsetTime(double phase) {
    int hour = (18 + (phase * 24)).toInt() % 24;
    int minute = ((phase * 24 * 60) % 60).toInt();
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  /// Moon Altitude & Azimuth rough calculation
  static Map<String, double> getMoonPosition(DateTime date, double latitude, double longitude) {
    final hourAngle = (date.hour + date.minute / 60.0) * 15.0 - longitude;
    final altitude = 45.0 + 25.0 * sin(hourAngle * pi / 180.0);
    final azimuth = (180.0 + hourAngle) % 360.0;
    return {'altitude': altitude.clamp(-90.0, 90.0), 'azimuth': azimuth};
  }
}
