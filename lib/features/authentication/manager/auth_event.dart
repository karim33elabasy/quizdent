import 'package:equatable/equatable.dart';
import 'package:quizdent/features/authentication/data/models/login_model.dart';
import 'package:quizdent/features/authentication/data/models/signup_model.dart';

abstract class AuthEvent extends Equatable{
  const AuthEvent();
  @override
  get props => [];
}

class LoginAuthEvent extends AuthEvent{
  final LoginModel loginModel;
  const LoginAuthEvent({required this.loginModel});
}

class SignupAuthEvent extends AuthEvent{
  final SignupModel signupModel;
  const SignupAuthEvent({required this.signupModel});
}

class ForgetPasswordAuthEvent extends AuthEvent{
  final String email;
  const ForgetPasswordAuthEvent({required this.email});
}