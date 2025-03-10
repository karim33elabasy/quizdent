import 'package:quizdent/features/home/domain/entities/event_category_entity.dart';
import 'package:quizdent/features/home/data/models/event_category_model.dart';

class EventCategoryMapper {
  static EventCategoryModel toModel({required EventCategoryEntity entity}) {
    return EventCategoryModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      createdAt: entity.createdAt,
      createdBy: entity.createdBy,
    );
  }

  static EventCategoryEntity toEntity({required EventCategoryModel model}) {
    return EventCategoryEntity(
      id: model.id,
      title: model.title,
      description: model.description,
      createdAt: model.createdAt,
      createdBy: model.createdBy,
    );
  }
}
