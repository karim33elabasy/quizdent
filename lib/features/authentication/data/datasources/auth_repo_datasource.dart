import 'package:quizdent/features/authentication/data/models/login_model.dart';
import 'package:quizdent/features/authentication/data/models/signup_model.dart';

abstract class AuthRepoDatasource {
  Future login({required LoginModel loginModel});
  Future signup({required SignupModel signupModel});
  Future forgetPassword({required String email});
}