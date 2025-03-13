import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/core/usecases/main_usecase.dart';
import 'package:quizdent/features/authentication/domain/utilities/user_entity.dart';
import 'package:quizdent/features/profile/domain/repo/profile_repo.dart';

class UpdateUserDataUseCase extends MainUseCase<Unit,UserEntity>{
  final ProfileRepo profileRepo;
  UpdateUserDataUseCase({required this.profileRepo});

  @override
  Future<Either<Failure, Unit>> call({required UserEntity params}) async {
    return await profileRepo.updateProfile(userEntity: params);
  }
}