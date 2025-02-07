import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/strings/strings_of_auth.dart';
import 'package:quizdent/core/strings/strings_of_errors.dart';
import 'package:quizdent/core/validators/validation.dart';
import 'package:quizdent/core/widgets/dialogs/show_my_dialog.dart';
import 'package:quizdent/core/widgets/my_loading_button.dart';
import 'package:quizdent/core/widgets/my_tff.dart';
import 'package:quizdent/features/authentication/manager/auth_bloc.dart';
import 'package:quizdent/features/authentication/manager/auth_event.dart';
import 'package:quizdent/features/authentication/manager/auth_state.dart';

class ResetPasswordDialog extends StatelessWidget {
  const ResetPasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    GlobalKey<FormState> forgetPassFormKey = GlobalKey<FormState>();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is FailureForgetPasswordAuthState) {
          ShowMyDialog.showErrorDialog(context: context, title: StringsOfErrors.resetPasswordAuthError, message: state.errorMessage);
        } else if(state is ChangedPasswordAuthState) {
          Navigator.pop(context);
          ShowMyDialog.showSuccessDialog(context: context, title: StringsOfAuth.resetPasswordConfirmBoxTitle, message: StringsOfAuth.resetPasswordConfirmBoxMessage);
        }
      },
      child: AlertDialog(
        title: const Text(StringsOfAuth.resetPasswordWord),
        content: Form(
          key: forgetPassFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(StringsOfAuth.resetPasswordInstructions),
              const SizedBox(height: 16),
              MyTff(
                validator: Validation.validateEmail,
                  label: StringsOfAuth.emailWord,
                  controller: email
              )
            ],
          ),
        ),
        actions: [
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return MyLoadingButton(
                onPressed: () {
                  if(forgetPassFormKey.currentState?.validate() ?? false){
                    context.read<AuthBloc>().add(ForgetPasswordAuthEvent(email: email.text));
                  }
                },
                title: StringsOfAuth.sendResetLinkWord,
                isLoading: state is LoadingForgetPasswordAuthState,
              );
            },
          )
        ],
      ),
    );
  }
}
