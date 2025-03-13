import 'package:quizdent/features/support/data/model/user_msg_model.dart';
import 'package:quizdent/features/support/domain/entities/user_msg_entity.dart';

class UserMsgMapper {
  /// Converts a `UserMsgEntity` to a `UserMsgModel`
  static UserMsgModel toModel({required UserMsgEntity entity}) {
    return UserMsgModel(
      userId: entity.userId,
      title: entity.title,
      message: entity.message,
      msgTime: entity.msgTime,
    );
  }

  /// Converts a `UserMsgModel` to a `UserMsgEntity`
  static UserMsgEntity toEntity({required UserMsgModel model}) {
    return UserMsgEntity(
      userId: model.userId,
      title: model.title,
      message: model.message,
      msgTime: model.msgTime,
    );
  }
}