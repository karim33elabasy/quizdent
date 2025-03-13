import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/core/usecases/main_usecase.dart';
import 'package:quizdent/features/support/domain/entities/user_msg_entity.dart';
import 'package:quizdent/features/support/domain/repo/support_repo.dart';

class SubmitUserMsgUseCase extends MainUseCase<Unit, UserMsgEntity> {
  final SupportRepo supportRepo;
  const SubmitUserMsgUseCase({required this.supportRepo});
  @override
  Future<Either<Failure, Unit>> call({required UserMsgEntity params}) {
    return supportRepo.submitUserMsg(userMsgEntity: params);
  }

}