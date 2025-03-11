import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_profile_screen.dart';
import 'package:quizdent/core/variables_and_enums/shared_pref_variables.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_bloc.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_events.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_states.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_settings_group.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_settings_item.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/icon_style.dart';
import 'package:quizdent/features/profile/presentation/widgets/dialogs/change_language_dialog.dart';

class AppPreferences extends StatelessWidget {
  const AppPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileBloc profileBloc = context.read();
    return BlocBuilder<ProfileBloc, ProfileStates>(
      builder: (context, state) {
        bool isDarkMode = SharedPrefVariables.isDarkMode;
        return SettingsGroup(
          items: [
            SettingsItem(
              icons: Icons.dark_mode_rounded,
              onTap: (){
                profileBloc.add(ProfileEventsChangeDarkMode(isDarkMode: !isDarkMode));
              },
              iconStyle: IconStyle(
                iconsColor: isDarkMode? AppColors.black:AppColors.white,
                withBackground: true,
                backgroundColor: isDarkMode? AppColors.white:AppColors.black,
              ),
              title: StringsOfProfileScreen.darkModeWord,
              subtitle: isDarkMode? StringsOfProfileScreen.activeWord:StringsOfProfileScreen.automaticWord,
              trailing: Switch.adaptive(
                value: isDarkMode,
                onChanged: (value) {
                  profileBloc.add(ProfileEventsChangeDarkMode(isDarkMode: value));
                },
              ),
            ),
            SettingsItem(
              onTap: (){
                showDialog(context: context, builder: (context)=> const ChangeLanguageDialog());
              },
              icons: Icons.language,
              iconStyle: IconStyle(
                backgroundColor: Colors.teal
              ),
              title: StringsOfProfileScreen.langPref,
              subtitle: StringsOfProfileScreen.changeAppLang,
            )
          ]
        );
      },
    );
  }
}
