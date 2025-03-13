import 'package:flutter/material.dart';
import 'package:quizdent/core/widgets/dialogs/my_dialog.dart';
import 'package:quizdent/core/widgets/my_button.dart';

abstract class ShowMyDialog {
  static void showInfoDialog({
    required BuildContext context,
    required String title,
    required String message,
    String buttonText = 'OK',
    VoidCallback? onPressed,
    bool barrierDismissible = true,
  }) {
    _showDialog(
      context: context,
      title: title,
      message: message,
      icon: const Icon(
        Icons.info,
        color: Colors.blue,
        size: 48,
      ),
      buttonText: buttonText,
      onPressed: onPressed,
      barrierDismissible: barrierDismissible,
    );
  }

  static void showSuccessDialog({
    required BuildContext context,
    required String title,
    required String message,
    String buttonText = 'OK',
    VoidCallback? onPressed,
    bool barrierDismissible = true,
  }) {
    _showDialog(
      context: context,
      title: title,
      message: message,
      icon: const Icon(
        Icons.check_circle,
        color: Colors.green,
        size: 48,
      ),
      buttonText: buttonText,
      onPressed: onPressed,
      barrierDismissible: barrierDismissible,
    );
  }

  static void showErrorDialog({
    required BuildContext context,
    required String title,
    required String message,
    String buttonText = 'OK',
    VoidCallback? onPressed,
    bool barrierDismissible = true,
  }) {
    _showDialog(
      context: context,
      title: title,
      message: message,
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 48,
      ),
      buttonText: buttonText,
      onPressed: onPressed,
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<bool> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = 'Save',
    Icon? icon,
    bool barrierDismissible = true,
  }) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => MyDialog(
        title: title,
        content: Column(
          children: [
            if (icon != null) ...[
              icon,
              const SizedBox(height: 16),
            ],
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            MyButton(
                onPressed: () => Navigator.pop(context, true),
                title: confirmText,
                isBlue: true
            )
          ],
        ),
      ),
    ) ??
        false; // Return false if the dialog is dismissed without a choice
  }

  static void _showDialog({
    required BuildContext context,
    required String title,
    required String message,
    required Icon icon,
    required String buttonText,
    VoidCallback? onPressed,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => MyDialog(
        title: title,
        content: Column(
          children: [
            icon,
            const SizedBox(height: 16),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onPressed ?? () => Navigator.pop(context),
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}