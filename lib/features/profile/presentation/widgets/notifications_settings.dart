import 'package:flutter/material.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_profile_screen.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_settings_group.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/babs_component_settings_item.dart';
import 'package:quizdent/features/profile/presentation/widgets/bob_items/icon_style.dart';
import 'package:quizdent/features/profile/presentation/widgets/dialogs/notifications_settings_dialog.dart';

class NotificationsSettings extends StatelessWidget {
  const NotificationsSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsGroup(
      items: [
        SettingsItem(
          onTap: () {
            showDialog(context: context, builder: (context)=>const NotificationSettingsDialog(),);
          },
          icons: Icons.notification_important_sharp,
          iconStyle: IconStyle(
            backgroundColor: Colors.purple,
          ),
          title: StringsOfProfileScreen.notificationsSettings,
          subtitle: StringsOfProfileScreen.notificationsPrefSubtitle,
        ),
      ],
    );
  }
}
