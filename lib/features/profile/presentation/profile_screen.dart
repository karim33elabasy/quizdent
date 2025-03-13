import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_profile_screen.dart';
import 'package:quizdent/core/strings/strings_of_auth.dart';
import 'package:quizdent/core/strings/strings_of_errors.dart';
import 'package:quizdent/core/utils/app_routes.dart';
import 'package:quizdent/core/utils/services_locator.dart';
import 'package:quizdent/core/widgets/dialogs/show_my_dialog.dart';
import 'package:quizdent/core/widgets/snack_bars/my_snack_bar.dart';
import 'package:quizdent/features/authentication/domain/utilities/user_entity.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_bloc.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_events.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_states.dart';
import 'package:quizdent/features/profile/presentation/widgets/app_prefrences.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_settings_group.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_settings_item.dart';
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

    saveChangesOnPop()async{
      final UserEntity newUserEntity = UserEntity.fromJson(_profileBloc.currentUserDataToEdit);
      if(newUserEntity == widget.userEntity){
        Navigator.pop(context);
      }else{
        bool userExit = await ShowMyDialog.showConfirmationDialog(
          context: context,
          title: "Exit without saving",
          message: "You will lose modified data if exited without saving",
        );
        userExit? {
          _profileBloc.add(
              ProfileEventsSaveUserInfo(userEntity: newUserEntity)), Navigator.pop(context)
        }
            : Navigator.pop(context);
      }
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: saveChangesOnPop, icon: const Icon(Icons.arrow_back_rounded,color: Colors.white,)),
        title: Text(StringsOfProfileScreen.profileScreenTitle,style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22,color: AppColors.white),),
        centerTitle: true,
        backgroundColor: Theme.of(context).brightness == Brightness.dark? AppColors.black:AppColors.primary,
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
            if(didPop) {
              return;
            } else{
              saveChangesOnPop();
            }
          },
        child: SafeArea(
          minimum: const EdgeInsets.all(Sizes.sm),
          child: BlocConsumer<ProfileBloc, ProfileStates>(
            builder: (context, state) {
              return ListView(
                  children: [
                    ProfileBigCard(profileBloc: _profileBloc),
                    PersonalInfoGroup(profileBloc: _profileBloc),
                    const AppPreferences(),
                    const NotificationsSettings(),

                    SettingsGroup(
                      items: [
                        SettingsItem(
                          onTap: ()async{
                            bool userExit = await ShowMyDialog.showConfirmationDialog(context: context, title: StringsOfProfileScreen.exitTitle, message: StringsOfProfileScreen.exitBody,confirmText: StringsOfProfileScreen.signOutWord);
                            userExit? {
                              Navigator.pushReplacementNamed(context, AppRoutes.kAuthScreen),
                              getIt.get<FirebaseAuth>().signOut()
                            }:null;
                          },
                          icons: Icons.exit_to_app_rounded,
                          title: "Sign Out",
                        ),
                      ],
                    ),
                  ],
                );
            },
            listener: (BuildContext context, ProfileStates state) {
              if(state is ProfileStatesSavedUserInfoSuccess){
                ScaffoldMessenger.of(context).showSnackBar(mySnackBar(text: StringsOfProfileScreen.infoSavedSuccess, okBtn: true, context: context));
              }else if(state is ProfileStatesFailure){
                ShowMyDialog.showErrorDialog(context: context, title: StringsOfErrors.errorOccurred, message: state.message);
              }
            },
          ),
        ),
      ),
    );
  }
}
