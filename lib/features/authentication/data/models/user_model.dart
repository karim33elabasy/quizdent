import 'package:equatable/equatable.dart';

class UserModel extends Equatable{
  final String firstName;
  final String lastName;
  final String email;

  const UserModel({required this.firstName, required this.lastName, required this.email});

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

  @override
  get props => [firstName, lastName, email];
}