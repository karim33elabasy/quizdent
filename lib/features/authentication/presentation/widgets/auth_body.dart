import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/app_assets.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/strings_of_auth.dart';
import 'package:quizdent/core/widgets/my_button.dart';
import 'package:quizdent/features/authentication/presentation/widgets/login_body.dart';
import 'package:quizdent/features/authentication/presentation/widgets/signup_body.dart';

class AuthBody extends StatefulWidget {
  const AuthBody({super.key});

  @override
  State<AuthBody> createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody> {
  bool isLogin = true;

  void authSwitch(){
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text(
        //     StringsOfAuth.authSubtitle,
        //     style: Theme.of(context).textTheme.headlineMedium,
        //   textAlign: TextAlign.center,
        // ),
        Image.asset(AppAssets.welcomePhoto),
        const SizedBox(height: Sizes.xl,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: MyButton(
                onPressed: (){
                    setState(() {isLogin= false;});
                  },
                title: StringsOfAuth.signupWord, isBlue: !isLogin
              ),
            ),
            const SizedBox(width: Sizes.md,),
            Expanded(
              child: MyButton(
                onPressed: (){setState(() {isLogin= true;});},
                title: StringsOfAuth.loginWord, isBlue: isLogin
              ),
            ),
          ],
        ),
        const SizedBox(height: Sizes.xl,),
        isLogin? LoginBody(authSwitcher: authSwitch,):SignupBody(authSwitcher: authSwitch,)

      ],
    );
  }
}
