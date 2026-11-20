class EclipseModel {
  final String title;
  final String type; // Total Solar, Partial Lunar, etc.
  final DateTime date;
  final String visibility;
  final String duration;
  final String description;

  EclipseModel({
    required this.title,
    required this.type,
    required this.date,
    required this.visibility,
    required this.duration,
    required this.description,
  });
}
