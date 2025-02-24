import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/core/usecases/main_usecase.dart';
import 'package:quizdent/features/authentication/data/repo/auth_repo_implem.dart';

class ForgetPasswordUsecase extends MainUseCase<Unit,String> {
  final AuthRepoImpl authRepoImpl;
  const ForgetPasswordUsecase({required this.authRepoImpl});

  @override
  Future<Either<Failure, Unit>> call({required String params}) {
    return authRepoImpl.forgetPassword(email: params);
  }

}