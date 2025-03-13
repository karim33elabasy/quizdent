import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/core/failure/repo_implementation_failure.dart';
import 'package:quizdent/core/strings/strings_of_error_codes.dart';
import 'package:quizdent/features/support/data/data_source/main_support_data_source.dart';
import 'package:quizdent/features/support/data/mapper/user_msg_mapper.dart';
import 'package:quizdent/features/support/data/model/user_msg_model.dart';
import 'package:quizdent/features/support/domain/entities/user_msg_entity.dart';
import 'package:quizdent/features/support/domain/repo/support_repo.dart';


class SupportRepoImplem implements SupportRepo {
  final MainSupportDataSource dataSource;
  SupportRepoImplem({required this.dataSource});

  @override
  Future<Either<Failure, Unit>> submitUserMsg({required UserMsgEntity userMsgEntity}) async {
    try {
      final UserMsgModel userMsgModel = UserMsgMapper.toModel(entity: userMsgEntity);
      await dataSource.submitUserMsg(userMsgModel: userMsgModel);
      return const Right(unit);
    } catch (exception) {
      return Left(
        RepoImplementationFailure(
          repoType: StringsOfErrorCodes.repoType,
          errorMsg: exception.toString(),
        ),
      );
    }
  }
}