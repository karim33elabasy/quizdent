import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_profile_screen.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_settings_group.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_settings_item.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/icon_style.dart';

class AppPreferences extends StatelessWidget {
  const AppPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SettingsGroup(
      items: [
        SettingsItem(
          onTap: () {},
          icons: Icons.dark_mode_rounded,
          iconStyle: IconStyle(
            iconsColor: isDarkMode? AppColors.black:AppColors.white,
            withBackground: true,
            backgroundColor: isDarkMode? AppColors.white:AppColors.black,
          ),
          title: StringsOfProfileScreen.darkModeWord,
          subtitle: isDarkMode? StringsOfProfileScreen.activeWord:StringsOfProfileScreen.automaticWord,
          trailing: Switch.adaptive(
            value: isDarkMode,
            onChanged: (value) {},
          ),
        ),
        SettingsItem(
          icons: Icons.language,
          iconStyle: IconStyle(
            backgroundColor: Colors.teal
          ),
          title: StringsOfProfileScreen.langPref,
          subtitle: StringsOfProfileScreen.changeAppLang,
        )
      ]
    );
  }
}
