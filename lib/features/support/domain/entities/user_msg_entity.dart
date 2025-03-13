import 'package:equatable/equatable.dart';

class UserMsgEntity extends Equatable {
  final String userId;
  final String title;
  final String message;
  final DateTime msgTime;

  const UserMsgEntity({
    required this.userId,
    required this.title,
    required this.message,
    required this.msgTime,
  });

  @override
  List<Object?> get props => [userId, title, message, msgTime];

}