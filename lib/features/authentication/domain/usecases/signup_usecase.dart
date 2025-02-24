import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/core/usecases/main_usecase.dart';
import 'package:quizdent/features/authentication/domain/repo/auth_repo.dart';
import 'package:quizdent/features/authentication/domain/utilities/signup_entity.dart';

class SignupUsecase extends MainUseCase<Unit,SignupEntity> {
  final AuthRepo authRepo;
  const SignupUsecase({required this.authRepo});

  @override
  Future<Either<Failure, Unit>> call({required SignupEntity params}) {
    return authRepo.signup(signupEntity: params);
  }

}