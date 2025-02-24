import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/features/authentication/data/repo/auth_repo_implem.dart';
import 'package:quizdent/features/authentication/domain/utilities/login_entity.dart';
import '../../../../core/usecases/main_usecase.dart';

class LoginUsecase extends MainUseCase<Unit, LoginEntity> {
  final AuthRepoImpl authRepoImpl;
  const LoginUsecase({required this.authRepoImpl});

  @override
  Future<Either<Failure, Unit>> call({required LoginEntity params}) {
     return authRepoImpl.login(loginEntity: params);
  }

}