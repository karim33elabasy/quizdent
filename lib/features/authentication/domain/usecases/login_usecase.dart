import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/features/authentication/domain/repo/auth_repo.dart';
import 'package:quizdent/features/authentication/domain/utilities/login_entity.dart';
import '../../../../core/usecases/main_usecase.dart';

class LoginUsecase extends MainUseCase<Unit, LoginEntity> {
  final AuthRepo authRepo;
  const LoginUsecase({required this.authRepo});

  @override
  Future<Either<Failure, Unit>> call({required LoginEntity params}) {
     return authRepo.login(loginEntity: params);
  }

}