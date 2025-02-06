import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/strings_of_auth.dart';
import 'package:quizdent/core/strings/strings_of_errors.dart';
import 'package:quizdent/core/validators/validation.dart';
import 'package:quizdent/core/widgets/dialogs/show_my_dialog.dart';
import 'package:quizdent/core/widgets/my_loading_button.dart';
import 'package:quizdent/core/widgets/my_tff.dart';
import 'package:quizdent/features/authentication/data/models/signup_model.dart';
import 'package:quizdent/features/authentication/manager/auth_bloc.dart';
import 'package:quizdent/features/authentication/manager/auth_event.dart';
import 'package:quizdent/features/authentication/manager/auth_state.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> sinUpFormKey = GlobalKey<FormState>();
    TextEditingController firstName = TextEditingController();
    TextEditingController lastName = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();

    signUp() {
      if(sinUpFormKey.currentState?.validate() ?? false){
        final signupModel = SignupModel(firstName: firstName.text, lastName: lastName.text, email: email.text, password: password.text,createdAt: DateTime.now());
        context.read<AuthBloc>().add(SignupAuthEvent(signupModel: signupModel));
      }
    }

    return  BlocListener<AuthBloc,AuthState>(
      listener: (context,state){
        if(state is FailureAuthState) ShowMyDialog.showErrorDialog(context: context, title: StringsOfErrors.signupAuthError, message: state.errorMessage);
      },
      child: Form(
        key: sinUpFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: MyTff(label: StringsOfAuth.firstNameWord, validator: Validation.validateName, controller: firstName,)),
                const SizedBox(width: Sizes.md,),
                Expanded(child: MyTff(label: StringsOfAuth.lastNameWord, validator: Validation.validateName, controller: lastName,)),
              ],
            ),
            const SizedBox(height: Sizes.lg,),
            MyTff(label: StringsOfAuth.emailWord,validator: Validation.validateEmail, controller: email),
            const SizedBox(height: Sizes.lg,),
            MyTff(label: StringsOfAuth.passwordWord,validator: Validation.validatePassword, controller: password),
            const SizedBox(height: Sizes.lg,),
            MyTff(label: StringsOfAuth.confirmPasswordWord,validator: (confirmPassValue)=>Validation.validateConfirmPassword(password: password.text,confirmPassword: confirmPassValue), controller: confirmPassword),
            const SizedBox(height: Sizes.lg,),
            BlocBuilder<AuthBloc,AuthState>(
              builder: (context,state) {
                return MyLoadingButton(
                  onPressed: signUp,
                  isLoading: state is LoadingAuthState,
                  title: StringsOfAuth.signupWord
                );
              },
            ),
            const SizedBox(height: Sizes.lg,),
          ],
        ),
      ),
    );
  }
}
