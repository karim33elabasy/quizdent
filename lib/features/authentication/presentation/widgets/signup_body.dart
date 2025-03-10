import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/constants/enums.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/strings_of_auth.dart';
import 'package:quizdent/core/strings/strings_of_errors.dart';
import 'package:quizdent/core/validators_and_helpers/validation.dart';
import 'package:quizdent/core/widgets/dialogs/show_my_dialog.dart';
import 'package:quizdent/core/widgets/my_loading_button.dart';
import 'package:quizdent/core/widgets/my_tff.dart';
import 'package:quizdent/core/widgets/snack_bars/my_snack_bar.dart';
import 'package:quizdent/features/authentication/domain/utilities/signup_entity.dart';
import 'package:quizdent/features/authentication/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:quizdent/features/authentication/presentation/manager/auth_bloc/auth_event.dart';
import 'package:quizdent/features/authentication/presentation/manager/auth_bloc/auth_state.dart';
import 'package:quizdent/features/authentication/presentation/widgets/my_tff_password.dart';

class SignupBody extends StatelessWidget {
  final void Function() authSwitcher;
  const SignupBody({super.key, required this.authSwitcher});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> sinUpFormKey = GlobalKey<FormState>();
    TextEditingController firstName = TextEditingController();
    TextEditingController lastName = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
    TextEditingController phoneNumber = TextEditingController();

    signUp() {
      if(sinUpFormKey.currentState?.validate() ?? false){
        final signupEntity = SignupEntity(
          userId: 'none',
          firstName: firstName.text,
          lastName: lastName.text,
          email: email.text,
          password: password.text,
          phoneNumber: phoneNumber.text,
          profilePicture: 'none',
          notificationPreferences: [],
          userRole: 'user',
          lastLoginDate: DateTime.now(),
          badges: [],
          location: 'none',
          langPref: LangPref.en,
          accountStatus: 'active',
          createdAt: DateTime.now(),
          favEvents: [],
          attendedEvents: []
        );
        context.read<AuthBloc>().add(SignupAuthEvent(signupEntity: signupEntity));
      }
    }

    return  BlocListener<AuthBloc,AuthState>(
      listener: (context,state){
        if(state is SignedUpAuthState) {
          ScaffoldMessenger.of(context).showSnackBar(
            mySnackBar(text: StringsOfAuth.signupSuccessSnackBar, okBtn: true, context: context)
          );
          authSwitcher();
        }
        if(state is FailureAuthState) ShowMyDialog.showErrorDialog(context: context, title: StringsOfErrors.signupAuthError, message: state.errorMessage);
      },
      child: Form(
        key: sinUpFormKey,
        child: Column(
          spacing: Sizes.lg,
          children: [
            Row(
              children: [
                Expanded(child: MyTff(label: StringsOfAuth.firstNameWord, validator: Validation.validateName, controller: firstName,)),
                const SizedBox(width: Sizes.md,),
                Expanded(child: MyTff(label: StringsOfAuth.lastNameWord, validator: Validation.validateName, controller: lastName,)),
              ],
            ),
            MyTff(label: StringsOfAuth.emailWord,validator: Validation.validateEmail, controller: email),
            MyTff(label: StringsOfAuth.phoneWord,validator: Validation.validateEgyptianPhoneNumber, controller: phoneNumber),
            MyTffPassword(label: StringsOfAuth.passwordWord,validator: Validation.validatePassword, controller: password),
            MyTffPassword(label: StringsOfAuth.confirmPasswordWord,validator: (confirmPassValue)=>Validation.validateConfirmPassword(password: password.text,confirmPassword: confirmPassValue), controller: confirmPassword),
            BlocBuilder<AuthBloc,AuthState>(
              builder: (context,state) {
                return MyLoadingButton(
                  onPressed: signUp,
                  isLoading: state is LoadingAuthState,
                  title: StringsOfAuth.signupWord
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
