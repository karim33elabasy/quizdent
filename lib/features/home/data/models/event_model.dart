import 'package:quizdent/features/home/domain/entities/event_entity.dart';

class EventModel extends EventEntity {
  EventModel({
    required super.id,
    required super.title,
    required super.subtitle,
    required super.description,
    required super.date,
    required super.location,
    required super.fees,
    required super.photo,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
    required super.createdBy,
    required super.speakers,
    required super.categoryId,
    required super.organizedBy,
  });

  /// Converts JSON to `EventModel`
  factory EventModel.fromJson({required Map<String, dynamic> json, required String id}) {
    return EventModel(
      id: id,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
      location: json['location'] as String,
      fees: (json['fees'] as num).toDouble(),
      photo: json['photo'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      createdBy: json['createdBy'] as String,
      speakers: List<String>.from(json['speakers'] ?? []),
      categoryId: json['categoryId'] as String,
      organizedBy: json['organizedBy'] as String,
    );
  }

  /// Converts `EventModel` to JSON
  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'date': date.toIso8601String(),
      'location': location,
      'fees': fees,
      'photo': photo,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'createdBy': createdBy,
      'speakers': speakers,
      'categoryId': categoryId,
      'organizedBy': organizedBy,
    };
  }
}
