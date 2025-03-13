import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/features/authentication/domain/utilities/user_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failure,Unit>> updateProfile({required UserEntity userEntity});
}