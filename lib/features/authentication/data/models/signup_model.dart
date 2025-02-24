import 'package:quizdent/features/authentication/domain/utilities/signup_entity.dart';

class SignupModel extends SignupEntity {

  const SignupModel({required super.firstName, required super.lastName, required super.email, required super.password, required super.createdAt});

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'createdAt': createdAt.toIso8601String()
    };
  }
}