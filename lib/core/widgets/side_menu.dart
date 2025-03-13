import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/constants/app_assets.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_profile_screen.dart';
import 'package:quizdent/core/utils/app_routes.dart';
import 'package:quizdent/core/utils/services_locator.dart';
import 'package:quizdent/core/widgets/dialogs/show_my_dialog.dart';
import 'package:quizdent/core/widgets/side_menu_item.dart';
import 'package:quizdent/features/authentication/presentation/manager/auth_bloc/auth_bloc.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.sizeOf(context).width*0.5,
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(Sizes.lg),
            width: double.infinity,
            child: Image.asset(AppAssets.logoImage,width: double.infinity,fit: BoxFit.fill,),
          ),
          SideMenuItem(
            iconData: Icons.home,
            title: "Home",
            onTap: (){
              Navigator.pushNamed(context, AppRoutes.kHomeScreen);
            },
          ),
          SideMenuItem(
            iconData: Icons.contact_support_outlined,
            title: "Contact Us",
            onTap: (){
              Navigator.pushNamed(context, AppRoutes.kMainSupportScreen);
            },
          ),
          SideMenuItem(
            iconData: Icons.settings,
            title: "Settings",
            onTap: (){
              Navigator.pushNamed(context, AppRoutes.kProfileScreen,arguments: context.read<AuthBloc>().user);
            },
          ),
          SideMenuItem(
            iconData: Icons.exit_to_app,
            iconColor: AppColors.textRed,
            title: StringsOfProfileScreen.signOutWord,
            onTap: ()async{
              bool userExit = await ShowMyDialog.showConfirmationDialog(context: context, title: StringsOfProfileScreen.exitTitle, message: StringsOfProfileScreen.exitBody,confirmText: StringsOfProfileScreen.signOutWord);
              userExit? {
                Navigator.pushReplacementNamed(context, AppRoutes.kAuthScreen),
                getIt.get<FirebaseAuth>().signOut()
              }:null;
            },
          ),


        ],
      ),
    );
  }
}
