import 'package:quizdent/features/support/data/model/user_msg_model.dart';

abstract class MainSupportDataSource {
  Future<void> submitUserMsg({required UserMsgModel userMsgModel});
}