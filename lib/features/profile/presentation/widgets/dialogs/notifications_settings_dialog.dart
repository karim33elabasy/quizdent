import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_profile_screen.dart';
import 'package:quizdent/core/widgets/dialogs/my_dialog.dart';
import 'package:quizdent/core/widgets/my_button.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_bloc.dart';

class NotificationSettingsDialog extends StatefulWidget {
  const NotificationSettingsDialog({super.key});

  @override
  State<NotificationSettingsDialog> createState() => _NotificationSettingsDialogState();
}

class _NotificationSettingsDialogState extends State<NotificationSettingsDialog> {
  late List<bool> _notificationStatus;

  // Define constants for notification states
  static const String enabled = "enabled";
  static const String disabled = "disabled";

  // Define notification types at the class level
  final List<String> notificationTypes = [
    "Event Reminders",
    "Promotional Offers",
    "New Features",
    "Security Alerts",
  ];

  @override
  void initState() {
    super.initState();
    // Initialize the notification status based on the currentUserDataToEdit map
    final profileBloc = context.read<ProfileBloc>();
    final notificationPreferences = List<String>.from(profileBloc.currentUserDataToEdit["notificationPreferences"]);

    // Ensure the list has the same length as notificationTypes
    if (notificationPreferences.length < notificationTypes.length) {
      notificationPreferences.addAll(
        List.filled(
          notificationTypes.length - notificationPreferences.length,
          disabled, // Default value
        ),
      );
    }

    _notificationStatus = notificationPreferences.map((status) => status == enabled).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MyDialog(
      title: StringsOfProfileScreen.notificationsSettings,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...notificationTypes.map((type) {
            final index = notificationTypes.indexOf(type);
            return SwitchListTile(
              title: Text(type),
              value: _notificationStatus[index],
              onChanged: (value) {
                setState(() {
                  _notificationStatus[index] = value;
                });
              },
            );
          }),
          const SizedBox(height: Sizes.lg,),
          MyButton(
            onPressed: () {
              // Update the currentUserDataToEdit map with the new notification preferences
              final profileBloc = context.read<ProfileBloc>();
              profileBloc.currentUserDataToEdit["notificationPreferences"] =
                  _notificationStatus.map((status) => status ? enabled : disabled).toList();

              // Close the dialog
              Navigator.pop(context);
            },
            title: StringsOfProfileScreen.saveWord,
            isBlue: true,
          ),
        ],
      ),
    );
  }
}