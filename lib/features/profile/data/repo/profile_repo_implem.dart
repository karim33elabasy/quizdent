import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/core/failure/repo_implementation_failure.dart';
import 'package:quizdent/core/strings/strings_of_error_codes.dart';
import 'package:quizdent/features/authentication/data/mappers/user_mapper.dart';
import 'package:quizdent/features/authentication/domain/utilities/user_entity.dart';
import 'package:quizdent/features/profile/data/datasources/main_profile_data_source.dart';
import 'package:quizdent/features/profile/domain/repo/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final MainProfileDataSource mainProfileDataSource;
  ProfileRepoImpl({required this.mainProfileDataSource});

  @override
  Future<Either<Failure, Unit>> updateProfile({required UserEntity userEntity}) async {
    try {
      await mainProfileDataSource.updateUserProfile(
          userModel: UserMapper.toModel(userEntity: userEntity));
      return const Right(
          unit
      );
    } catch (exception) {
      return Left(
          RepoImplementationFailure(repoType: StringsOfErrorCodes.repoType,
              errorMsg: exception.toString())
      );
    }
  }
}