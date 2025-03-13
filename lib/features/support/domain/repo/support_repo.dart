import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/features/support/domain/entities/user_msg_entity.dart';

abstract class SupportRepo{
  Future<Either<Failure,Unit>> submitUserMsg({required UserMsgEntity userMsgEntity});
}