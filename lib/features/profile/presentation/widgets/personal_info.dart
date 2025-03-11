import 'package:flutter/material.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_profile_screen.dart';
import 'package:quizdent/features/authentication/presentation/widgets/reset_password_dialog.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_bloc.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_settings_group.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_settings_item.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/icon_style.dart';
import 'package:quizdent/features/profile/presentation/widgets/dialogs/edit_personal_info_dialog.dart';

class PersonalInfoGroup extends StatelessWidget {
  final ProfileBloc profileBloc;
  const PersonalInfoGroup({super.key, required this.profileBloc});

  @override
  Widget build(BuildContext context) {
    return SettingsGroup(
      items: [
        SettingsItem(
          onTap: () {
            showDialog(context: context, builder: (context)=>EditPersonalInfoDialog(profileBloc: profileBloc,));
          },
          icons: Icons.person,
          iconStyle: IconStyle(),
          title: StringsOfProfileScreen.personalInfo,
          subtitle: StringsOfProfileScreen.editPersonalInfo,
        ),
        SettingsItem(
          icons: Icons.security,
          onTap: (){
            showDialog(context: context, builder: (context)=> const ResetPasswordDialog());
          },
          title: StringsOfProfileScreen.changePass,
          iconStyle: IconStyle(
            backgroundColor: Colors.redAccent
          ),
        )
      ],
    );
  }
}
