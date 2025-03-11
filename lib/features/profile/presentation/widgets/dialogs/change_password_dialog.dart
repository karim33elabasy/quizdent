import 'package:flutter/material.dart';
import 'package:quizdent/core/strings/strings_of_auth.dart';
import 'package:quizdent/core/widgets/dialogs/my_dialog.dart';

class ChangePasswordDialog extends StatelessWidget {

  const ChangePasswordDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return MyDialog(
      title: StringsOfAuth.changePasswordWord,
      content: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: StringsOfAuth.enterEmailWord),
          ),
        ],
      ),
    );
  }
}