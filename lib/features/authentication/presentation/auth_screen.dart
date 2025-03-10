import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/my_padding.dart';
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
