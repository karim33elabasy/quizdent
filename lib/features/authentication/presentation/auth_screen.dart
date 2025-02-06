import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/my_padding.dart';
import 'package:quizdent/core/strings/app_strings.dart';
import 'package:quizdent/core/widgets/my_appbar.dart';
import 'package:quizdent/features/authentication/presentation/widgets/auth_body.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyAppbar(title: AppStrings.appTitle),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MyPadding.bodyHorizontalSpace,
                  vertical: MyPadding.bodyVerticalSpace
                ),
                child: AuthBody(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
