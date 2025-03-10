import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_profile_screen.dart';
import 'package:quizdent/features/authentication/domain/utilities/user_entity.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_big_user_card.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_settings_item.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/icon_style.dart';
import 'package:random_avatar/random_avatar.dart';

import 'avatar_dialog.dart';

class ProfileBigCard extends StatelessWidget {
  final UserEntity userEntity;
  const ProfileBigCard({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return BigUserCard(
      userName: "${userEntity.firstName} ${userEntity.lastName}",
      backgroundColor: AppColors.primary,
      userProfilePic: RandomAvatar('karim'),
      cardActionWidget: SettingsItem(
        icons: Icons.edit,
        iconStyle: IconStyle(
          withBackground: true,
          borderRadius: 50,
          backgroundColor: Colors.yellow[600],
        ),
        title: StringsOfProfileScreen.modifyWord,
        subtitle: StringsOfProfileScreen.changeAvatar,
        onTap: () async{
          String? newAvatarSeed = await showDialog<String>(
            context: context,
            builder: (context) => AvatarGeneratorDialog(initialSeed: userEntity.profilePicture),
          );

          if (newAvatarSeed != null) {
            // Update the user's avatar seed
            print('object');
          }
        },
      ),
    );
  }
}
