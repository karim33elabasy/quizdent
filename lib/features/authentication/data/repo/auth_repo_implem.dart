import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/core/failure/repo_implementation_failure.dart';
import 'package:quizdent/core/strings/strings_of_error_codes.dart';
import 'package:quizdent/features/authentication/data/datasources/auth_repo_datasource.dart';
import 'package:quizdent/features/authentication/data/mappers/login_mapper.dart';
import 'package:quizdent/features/authentication/data/mappers/signup_mapper.dart';
import 'package:quizdent/features/authentication/domain/repo/auth_repo.dart';
import 'package:quizdent/features/authentication/domain/utilities/login_entity.dart';
import 'package:quizdent/features/authentication/domain/utilities/signup_entity.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRepoDatasource loginRepo;
  AuthRepoImpl({required this.loginRepo});

  @override
  Future<Either<Failure, Unit>> login({required LoginEntity loginEntity}) async {
    try{
      await loginRepo.login(loginModel: LoginMapper.toModel(loginEntity: loginEntity));
      return const Right(unit);
    }catch(exception){
      return Left(
        RepoImplementationFailure(repoType: StringsOfErrorCodes.repoType,errorMsg: exception.toString())
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> signup({required SignupEntity signupEntity}) async{
    try{
      await loginRepo.signup(signupModel: SignupMapper.toModel(signupEntity: signupEntity));
      return const Right(unit);
    }catch(exception){
      return Left(
          RepoImplementationFailure(repoType: StringsOfErrorCodes.repoType,errorMsg: exception.toString())
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> forgetPassword({required String email}) async{
    try{
      await loginRepo.forgetPassword(email: email);
      return const Right(unit);
    }catch(exception){
      return Left(
          RepoImplementationFailure(repoType: StringsOfErrorCodes.repoType,errorMsg: exception.toString())
      );
    }
  }
}