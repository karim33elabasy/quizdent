import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_profile_screen.dart';
import 'package:quizdent/features/authentication/domain/utilities/user_entity.dart';
import 'package:quizdent/features/profile/presentation/widgets/app_prefrences.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_big_user_card.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_settings_group.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_settings_item.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/icon_style.dart';
import 'package:quizdent/features/profile/presentation/widgets/personal_info.dart';
import 'package:quizdent/features/profile/presentation/widgets/profile_big_card.dart';
import 'package:random_avatar/random_avatar.dart';

class ProfileScreen extends StatelessWidget {
  final UserEntity userEntity;
  const ProfileScreen({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_rounded,color: Colors.white,)),
        title: Text(StringsOfProfileScreen.profileScreenTitle,style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22,color: AppColors.white),),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.save,color: AppColors.white),
            onPressed: (){},
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(Sizes.sm),
        child: ListView(
          children: [
            ProfileBigCard(userEntity: userEntity,),
            PersonalInfoGroup(userEntity: userEntity,),
            AppPreferences(),

            SettingsGroup(
              items: [

              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'About',
                  subtitle: "Learn more about Ziar'App",
                ),
              ],
            ),
            // You can add a settings title
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.exit_to_app_rounded,
                  title: "Sign Out",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.delete_solid,
                  title: "Delete account",
                  titleStyle: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
