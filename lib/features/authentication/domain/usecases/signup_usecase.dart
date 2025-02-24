import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/core/usecases/main_usecase.dart';
import 'package:quizdent/features/authentication/data/repo/auth_repo_implem.dart';
import 'package:quizdent/features/authentication/domain/utilities/signup_entity.dart';

class SignupUsecase extends MainUseCase<Unit,SignupEntity> {
  final AuthRepoImpl authRepoImpl;
  const SignupUsecase({required this.authRepoImpl});

  @override
  Future<Either<Failure, Unit>> call({required SignupEntity params}) {
    return authRepoImpl.signup(signupEntity: params);
  }

}