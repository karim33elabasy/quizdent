import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_profile_screen.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_bloc.dart';
import 'package:quizdent/features/profile/presentation/widgets/dialogs/avatar_generator_dialog.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_big_user_card.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_settings_item.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/icon_style.dart';
import 'package:random_avatar/random_avatar.dart';

class ProfileBigCard extends StatefulWidget {
  final ProfileBloc profileBloc;
  const ProfileBigCard({super.key, required this.profileBloc});

  @override
  State<ProfileBigCard> createState() => _ProfileBigCardState();
}

class _ProfileBigCardState extends State<ProfileBigCard> {
  @override
  Widget build(BuildContext context) {
    return BigUserCard(
      userName: "${widget.profileBloc.currentUserDataToEdit['firstName']} ${widget.profileBloc.currentUserDataToEdit['lastName']}",
      backgroundColor: AppColors.primary,
      userProfilePic: RandomAvatar(widget.profileBloc.currentUserDataToEdit['profilePicture']),
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
          showDialog<String>(
            context: context,
            builder: (context) => AvatarGeneratorDialog(initialSeed: widget.profileBloc.currentUserDataToEdit['profilePicture']),
          );

        },
      ),
    );
  }
}
