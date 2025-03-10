import 'package:quizdent/features/home/domain/entities/event_entity.dart';
import 'package:quizdent/features/home/data/models/event_model.dart';

class EventMapper {
  static EventModel toModel({required EventEntity eventEntity}) {
    return EventModel(
      id: eventEntity.id,
      title: eventEntity.title,
      subtitle: eventEntity.subtitle,
      description: eventEntity.description,
      date: eventEntity.date,
      location: eventEntity.location,
      fees: eventEntity.fees,
      photo: eventEntity.photo,
      status: eventEntity.status,
      createdAt: eventEntity.createdAt,
      updatedAt: eventEntity.updatedAt,
      createdBy: eventEntity.createdBy,
      speakers: eventEntity.speakers,
      categoryId: eventEntity.categoryId,
      organizedBy: eventEntity.organizedBy,
    );
  }

  static EventEntity toEntity({required EventModel eventModel}) {
    return EventEntity(
      id: eventModel.id,
      title: eventModel.title,
      subtitle: eventModel.subtitle,
      description: eventModel.description,
      date: eventModel.date,
      location: eventModel.location,
      fees: eventModel.fees,
      photo: eventModel.photo,
      status: eventModel.status,
      createdAt: eventModel.createdAt,
      updatedAt: eventModel.updatedAt,
      createdBy: eventModel.createdBy,
      speakers: eventModel.speakers,
      categoryId: eventModel.categoryId,
      organizedBy: eventModel.organizedBy,
    );
  }
}
