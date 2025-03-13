import 'package:quizdent/features/support/domain/entities/user_msg_entity.dart';

class UserMsgModel extends UserMsgEntity {
  const UserMsgModel({
    required super.userId,
    required super.title,
    required super.message,
    required super.msgTime,
  });

  /// Converts JSON to `UserMsgModel`
  factory UserMsgModel.fromJson({required String userId, required Map<String, dynamic> json}) {
    return UserMsgModel(
      userId: userId,
      title: json['title'] as String,
      message: json['message'] as String,
      msgTime: DateTime.parse(json['msgTime'] as String),
    );
  }

  /// Converts `UserMsgModel` to JSON
  Map<String, dynamic> toJson() {
    return {
      // 'userId': userId, // Optional: Include if needed
      'title': title,
      'message': message,
      'msgTime': msgTime.toIso8601String(),
    };
  }
}