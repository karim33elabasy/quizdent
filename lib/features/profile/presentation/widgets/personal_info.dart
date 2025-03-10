import 'package:flutter/material.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_profile_screen.dart';
import 'package:quizdent/features/authentication/domain/utilities/user_entity.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_settings_group.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_settings_item.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/icon_style.dart';

class PersonalInfoGroup extends StatelessWidget {
  final UserEntity userEntity;
  const PersonalInfoGroup({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return SettingsGroup(
      items: [
        SettingsItem(
          onTap: () {},
          icons: Icons.pending_actions,
          iconStyle: IconStyle(),
          title: StringsOfProfileScreen.personalInfo,
          subtitle: StringsOfProfileScreen.editPersonalInfo,
        ),
        SettingsItem(
          icons: Icons.security,
          onTap: (){},
          title: StringsOfProfileScreen.changePass,
          iconStyle: IconStyle(
            backgroundColor: Colors.redAccent
          ),
        )
      ],
    );
  }
}
