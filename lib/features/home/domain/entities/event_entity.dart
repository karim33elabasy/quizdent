class EventEntity {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final DateTime date;
  final String location;
  final double fees;
  final String photo;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdBy;
  final List<String> speakers;
  final String categoryId;
  final String organizedBy;

  EventEntity(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.date,
      required this.location,
      required this.fees,
      required this.photo,
      required this.status,
      required this.createdAt,
      required this.updatedAt,
      required this.createdBy,
      required this.speakers,
      required this.categoryId,
      required this.organizedBy});
}
