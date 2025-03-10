import 'package:quizdent/features/home/data/models/speaker_model.dart';
import 'package:quizdent/features/home/domain/entities/speaker_entity.dart';

class SpeakerMapper {
  static SpeakerEntity toEntity({required SpeakerModel model}) {
    return SpeakerEntity(
      id: model.id,
      name: model.name,
      photo: model.photo,
      bio: model.bio,
      email: model.email,
      createdAt: model.createdAt,
      createdBy: model.createdBy,
    );
  }

  static SpeakerModel toModel({required SpeakerEntity entity}) {
    return SpeakerModel(
      id: entity.id,
      name: entity.name,
      photo: entity.photo,
      bio: entity.bio,
      email: entity.email,
      createdAt: entity.createdAt,
      createdBy: entity.createdBy,
    );
  }
}
