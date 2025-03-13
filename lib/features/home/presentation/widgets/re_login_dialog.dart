import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/widgets/dialogs/my_dialog.dart';

class ReLoginDialog extends StatelessWidget {
  const ReLoginDialog({super.key});

  void _navigateToAuthScreen(BuildContext context) {
    Navigator.pop(context); // Close the dialog
    Navigator.pushNamed(context, '/auth'); // Navigate to the Auth Screen
  }

  @override
  Widget build(BuildContext context) {
    return MyDialog(
      title: 'Session Expired',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Message
          const Text(
            'Your session has expired. Please log in again to continue.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: Sizes.lg),
          // Login Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _navigateToAuthScreen(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: Sizes.md),
              ),
              child: const Text(
                'Log In',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}