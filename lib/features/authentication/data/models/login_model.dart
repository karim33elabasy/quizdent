import 'package:quizdent/features/authentication/domain/utilities/login_entity.dart';

class LoginModel extends LoginEntity {

  const LoginModel({required super.email, required super.password});
  
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

}