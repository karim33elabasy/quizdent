import 'package:flutter/material.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_profile_screen.dart';
import 'package:quizdent/core/strings/strings_of_auth.dart';
import 'package:quizdent/core/validators_and_helpers/validation.dart';
import 'package:quizdent/core/widgets/dialogs/my_dialog.dart';
import 'package:quizdent/core/widgets/my_button.dart';
import 'package:quizdent/core/widgets/my_tff.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_bloc.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_events.dart';

class EditPersonalInfoDialog extends StatelessWidget {
  final ProfileBloc profileBloc;

  const EditPersonalInfoDialog({
    super.key,
    required this.profileBloc,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNameController = TextEditingController(text: profileBloc.currentUserDataToEdit['firstName']);
    final TextEditingController lastNameController = TextEditingController(text: profileBloc.currentUserDataToEdit['lastName']);
    final TextEditingController emailController = TextEditingController(text: profileBloc.currentUserDataToEdit['email']);
    final TextEditingController phoneController = TextEditingController(text: profileBloc.currentUserDataToEdit['phoneNumber']);
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return MyDialog(
      title: StringsOfProfileScreen.editPersonalInfoTitle,
      content: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min, // Use min to fit the content
            children: [
              // First Name Field
              MyTff(
                label: StringsOfAuth.firstNameWord,
                controller: firstNameController,
                validator: Validation.validateName,
              ),
              // Last Name Field
              MyTff(
                label: StringsOfAuth.lastNameWord,
                controller: lastNameController,
                validator: Validation.validateName,
              ),
              // Email Field
              MyTff(
                label: StringsOfAuth.emailWord,
                controller: emailController,
                validator: Validation.validateEmail,
              ),
              // Phone Number Field
              MyTff(
                label: StringsOfAuth.phoneWord,
                controller: phoneController,
                validator: Validation.validateEgyptianPhoneNumber,
              ),
              MyButton(
                  onPressed: (){
                    if (formKey.currentState!.validate()) {
                      profileBloc.currentUserDataToEdit['firstName'] = firstNameController.text;
                      profileBloc.currentUserDataToEdit['lastName'] = lastNameController.text;
                      profileBloc.currentUserDataToEdit['phoneNumber'] = phoneController.text;
                      profileBloc.currentUserDataToEdit['email'] = emailController.text;
                      profileBloc.add(ProfileEventsUpdateSettingsUI());
                      Navigator.pop(context);
                    }
                  },
                  title: StringsOfProfileScreen.saveWord,
                  isBlue: true
              ),
            ],
          ),
        ),
      ),
    );
  }
}