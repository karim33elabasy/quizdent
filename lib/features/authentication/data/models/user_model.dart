import 'package:quizdent/features/authentication/domain/utilities/user_entity.dart';

class UserModel extends UserEntity{

  const UserModel({required super.firstName, required super.lastName, required super.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }

}