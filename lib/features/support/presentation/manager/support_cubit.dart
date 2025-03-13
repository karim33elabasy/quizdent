import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/features/authentication/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:quizdent/features/support/domain/entities/user_msg_entity.dart';
import 'package:quizdent/features/support/domain/use_case/submit_user_msg_use_case.dart';
import 'support_states.dart';

class SupportCubit extends Cubit<SupportStates> {
  final SubmitUserMsgUseCase submitUserMsgUseCase;
  final AuthBloc authBloc;
  SupportCubit({required this.submitUserMsgUseCase, required this.authBloc})
      : super(SupportStateInitial());

  TextEditingController msgTitle = TextEditingController();
  TextEditingController msgBody = TextEditingController();

  submitUserMsg() async {
    var result = await submitUserMsgUseCase.call(params: _createMsgEntity());
    result.fold(
        (failure) => emit(SupportStateFailure(message: failure.errorMessage)),
        (success) {
      emit(SupportStateSuccess());
      msgTitle.clear();
      msgBody.clear();
    });
  }

  UserMsgEntity _createMsgEntity() {
    return UserMsgEntity(
        userId: authBloc.user!.userId,
        title: msgTitle.text,
        message: msgBody.text,
        msgTime: DateTime.now());
  }
}
