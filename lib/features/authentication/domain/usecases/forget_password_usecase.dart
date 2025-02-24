import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/core/usecases/main_usecase.dart';
import 'package:quizdent/features/authentication/domain/repo/auth_repo.dart';

class ForgetPasswordUsecase extends MainUseCase<Unit,String> {
  final AuthRepo authRepo;
  const ForgetPasswordUsecase({required this.authRepo});

  @override
  Future<Either<Failure, Unit>> call({required String params}) {
    return authRepo.forgetPassword(email: params);
  }

}