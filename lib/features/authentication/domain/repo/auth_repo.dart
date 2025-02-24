import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/features/authentication/domain/utilities/login_entity.dart';
import 'package:quizdent/features/authentication/domain/utilities/signup_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure,Unit>> signup({required SignupEntity signupEntity});
  Future<Either<Failure,Unit>> login({required LoginEntity loginEntity});
  Future<Either<Failure,Unit>> forgetPassword({required String email});
}