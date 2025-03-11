import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_profile_screen.dart';
import 'package:quizdent/features/authentication/domain/utilities/user_entity.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_bloc.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_states.dart';
import 'package:quizdent/features/profile/presentation/widgets/app_prefrences.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_settings_group.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_settings_item.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/icon_style.dart';
import 'package:quizdent/features/profile/presentation/widgets/dialogs/notifications_settings_dialog.dart';
import 'package:quizdent/features/profile/presentation/widgets/notifications_settings.dart';
import 'package:quizdent/features/profile/presentation/widgets/personal_info.dart';
import 'package:quizdent/features/profile/presentation/widgets/profile_big_card.dart';

class ProfileScreen extends StatefulWidget {
  final UserEntity userEntity;
  const ProfileScreen({super.key, required this.userEntity});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileBloc _profileBloc;

  @override
  void initState() {
    super.initState();
    // Initialize the bloc and assign the value to the late variable
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
    _profileBloc.currentUserDataToEdit = widget.userEntity.toJson();
  }

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
        child: BlocBuilder<ProfileBloc, ProfileStates>(
          builder: (context, state) {
            return ListView(
                children: [
                  ProfileBigCard(profileBloc: _profileBloc),
                  PersonalInfoGroup(profileBloc: _profileBloc),
                  const AppPreferences(),
                  const NotificationsSettings(),

                  // You can add a settings title
                  SettingsGroup(
                    items: [
                      SettingsItem(
                        onTap: () {},
                        icons: Icons.exit_to_app_rounded,
                        title: "Sign Out",
                      ),
                    ],
                  ),
                ],
              );
          },
        ),
      ),
    );
  }
}
