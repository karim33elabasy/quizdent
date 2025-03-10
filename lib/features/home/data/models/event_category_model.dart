import 'package:quizdent/features/home/domain/entities/event_category_entity.dart';

class EventCategoryModel extends EventCategoryEntity {
  const EventCategoryModel({
    required super.id,
    required super.title,
    required super.description,
    required super.createdAt,
    required super.createdBy,
  });

  /// Converts JSON to `EventCategoryModel`
  factory EventCategoryModel.fromJson({required String id,required Map<String, dynamic> json}) {
    return EventCategoryModel(
      id: id,
      title: json['title'] as String,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String,
    );
  }

  /// Converts `EventCategoryModel` to JSON
  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'title': title,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
    };
  }
}
