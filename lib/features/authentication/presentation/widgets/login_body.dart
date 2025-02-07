import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/strings_of_auth.dart';
import 'package:quizdent/core/strings/strings_of_errors.dart';
import 'package:quizdent/core/utils/app_router.dart';
import 'package:quizdent/core/validators/validation.dart';
import 'package:quizdent/core/widgets/dialogs/show_my_dialog.dart';
import 'package:quizdent/core/widgets/my_loading_button.dart';
import 'package:quizdent/core/widgets/my_tff.dart';
import 'package:quizdent/features/authentication/data/models/login_model.dart';
import 'package:quizdent/features/authentication/manager/auth_bloc.dart';
import 'package:quizdent/features/authentication/manager/auth_event.dart';
import 'package:quizdent/features/authentication/manager/auth_state.dart';
import 'package:quizdent/features/authentication/presentation/widgets/reset_password_dialog.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    login() {
      if(loginFormKey.currentState?.validate() ?? false){
        final loginModel = LoginModel(email: email.text, password: password.text);
        context.read<AuthBloc>().add(LoginAuthEvent(loginModel: loginModel));
      }
    }

    return BlocListener<AuthBloc,AuthState>(
      listener: (context,state){
        if(state is LoggedInAuthState) {
          context.pushReplacement(AppRouter.kHomeScreen);
        } else if(state is FailureAuthState) {
          ShowMyDialog.showErrorDialog(
              context: context,
              title: StringsOfErrors.loginAuthError,
              message: state.errorMessage);
        }
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
            MyTff(
              label: StringsOfAuth.passwordWord,
              validator: Validation.validatePassword,
              controller: password,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: (){
                  showDialog(context: context, builder: (context)=> const ResetPasswordDialog());
                },
                child: Text("Forget Password",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.primary),)
              ),
            ),
            const SizedBox(height: Sizes.lg,),
            BlocBuilder<AuthBloc,AuthState>(
              builder: (context,state) {
                return MyLoadingButton(
                    onPressed: login,
                    isLoading: state is LoadingForgetPasswordAuthState,
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