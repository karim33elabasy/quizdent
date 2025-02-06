import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/features/authentication/data/models/login_model.dart';
import 'package:quizdent/features/authentication/data/models/signup_model.dart';

abstract class AuthRepo {
  Future<Either<Failure,Unit>> signup({required SignupModel signupUser});
  Future<Either<Failure,Unit>> login({required LoginModel loginModel});
  Future<Either<Failure,Unit>> forgetPassword({required String email});
}