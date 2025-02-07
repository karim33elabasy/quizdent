import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable{
  const AuthState();
  @override
  get props => [];
}

class InitialAuthState extends AuthState{}

class LoadingAuthState extends AuthState{}

class LoadingForgetPasswordAuthState extends AuthState{}

class LoggedInAuthState extends AuthState{}

class SignedUpAuthState extends AuthState{}

class ChangedPasswordAuthState extends AuthState{}

class FailureAuthState extends AuthState{
  final String errorMessage;
  const FailureAuthState({required this.errorMessage});
}
class FailureForgetPasswordAuthState extends AuthState{
  final String errorMessage;
  const FailureForgetPasswordAuthState({required this.errorMessage});
}