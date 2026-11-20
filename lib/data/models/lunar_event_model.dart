class LunarEventModel {
  final String title;
  final String description;
  final DateTime date;
  final String category; // Supermoon, Eclipse, Meteor Shower, etc.
  final int daysUntil;

  LunarEventModel({
    required this.title,
    required this.description,
    required this.date,
    required this.category,
    required this.daysUntil,
  });
}
