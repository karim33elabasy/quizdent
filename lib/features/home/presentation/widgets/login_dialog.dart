import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quizdent/features/home/presentation/home_screen.dart';
import 'package:quizdent/features/home/presentation/widgets/task_fade_animation.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("${tr("wellDone")} !"),
      content: Text("${tr("accountCreated")}."),
      actions: [
        OutlinedButton(
          onPressed: (){
            // for closing the dialog.
            Navigator.pop(context);
            // Navigation to home screen.
            Navigator.push(
              context,
              TaskFadeAnimation(
                screen: const HomeScreen(),
                animationDuration: const Duration(seconds: 2)
              )
            );
          },
          child: Text(tr("close"))
        )
      ],
    );
  }
}

