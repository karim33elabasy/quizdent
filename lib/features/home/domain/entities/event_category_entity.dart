import 'package:equatable/equatable.dart';

class EventCategoryEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;
  final String createdBy;

  const EventCategoryEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.createdBy,
  });

  @override
  List<Object> get props => [id, title, description, createdAt, createdBy];
}
