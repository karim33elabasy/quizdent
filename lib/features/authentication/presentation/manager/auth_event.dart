import 'package:equatable/equatable.dart';
import 'package:quizdent/features/authentication/domain/utilities/login_entity.dart';
import 'package:quizdent/features/authentication/domain/utilities/signup_entity.dart';

abstract class AuthEvent extends Equatable{
  const AuthEvent();
  @override
  get props => [];
}

class LoginAuthEvent extends AuthEvent{
  final LoginEntity loginEntity;
  const LoginAuthEvent({required this.loginEntity});
}

class SignupAuthEvent extends AuthEvent{
  final SignupEntity signupEntity;
  const SignupAuthEvent({required this.signupEntity});
}

class ForgetPasswordAuthEvent extends AuthEvent{
  final String email;
  const ForgetPasswordAuthEvent({required this.email});
}