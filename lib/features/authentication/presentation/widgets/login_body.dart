import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/app_routes.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/strings_of_auth.dart';
import 'package:quizdent/core/strings/strings_of_errors.dart';
import 'package:quizdent/core/validators_and_helpers/validation.dart';
import 'package:quizdent/core/widgets/dialogs/show_my_dialog.dart';
import 'package:quizdent/core/widgets/my_loading_button.dart';
import 'package:quizdent/core/widgets/my_tff.dart';
import 'package:quizdent/core/widgets/snack_bars/my_snack_bar.dart';
import 'package:quizdent/features/authentication/domain/utilities/login_entity.dart';
import 'package:quizdent/features/authentication/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:quizdent/features/authentication/presentation/manager/auth_bloc/auth_event.dart';
import 'package:quizdent/features/authentication/presentation/manager/auth_bloc/auth_state.dart';
import 'package:quizdent/features/authentication/presentation/widgets/my_tff_password.dart';

class LoginBody extends StatelessWidget {
  final void Function() authSwitcher;
  const LoginBody({super.key, required this.authSwitcher});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    login() {
      if(loginFormKey.currentState?.validate() ?? false){
        final loginEntity = LoginEntity(email: email.text, password: password.text);
        context.read<AuthBloc>().add(LoginAuthEvent(loginEntity: loginEntity));
      }
    }

    return BlocListener<AuthBloc,AuthState>(
      listener: (context,state){
        if(state is FailureAuthState) ShowMyDialog.showErrorDialog(context: context, title: StringsOfErrors.loginAuthError, message: state.errorMessage);
        if(state is LoggedInAuthState) {
          ScaffoldMessenger.of(context).showSnackBar(mySnackBar(text: "You have signed in successfully.", okBtn: true, context: context));
          Navigator.pushReplacementNamed(context, AppRoutes.kHomeScreen);}
        },
      child: Form(
        key: loginFormKey,
        child: Column(
          children: [
            MyTff(
              label: StringsOfAuth.emailWord,
              validator: Validation.validateEmail,
              controller: email,
            ),
            const SizedBox(height: Sizes.lg,),
            MyTffPassword(
              label: StringsOfAuth.passwordWord,
              validator: Validation.validatePassword,
              controller: password,
            ),
            const SizedBox(height: Sizes.lg,),
            BlocBuilder<AuthBloc,AuthState>(
              builder: (context,state) {
                return MyLoadingButton(
                    onPressed: login,
                    isLoading: state is LoadingAuthState,
                    title: StringsOfAuth.loginWord
                );
              },
            )
          ],
        ),
      ),
    );
  }
}