import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:quizdent/app.dart';
import 'package:quizdent/core/widgets/dialogs/show_my_dialog.dart';

abstract class NotificationsServices {
  static final _fcm = FirebaseMessaging.instance;

  static Future<void> initNotifications() async {
    await _fcm.requestPermission();
    // String? token = await _fcm.getToken();
    handleForegroundNotifications();
    handleBackgroundNotifications();
  }

  /// Handle notifications when the app is in the foreground
  static void handleForegroundNotifications() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Show a dialog when a notification is received
      ShowMyDialog.showInfoDialog(
        context: navigatorKey.currentState!.overlay!.context,
        title: message.notification?.title ?? "New Notification",
        message: message.notification?.body ?? ""
      );}
    );
  }

  /// Handle notifications when the app is in the background or terminated
  static void handleBackgroundNotifications() {
    // Handle notification when the app is opened from a terminated state
    FirebaseMessaging.instance.getInitialMessage().then(handleReceivedNotifications);

    // Handle notification when the app is in the background and opened via notification tap
    FirebaseMessaging.onMessageOpenedApp.listen(handleReceivedNotifications);
  }

  /// Handle received notifications (common logic for foreground and background)
  static void handleReceivedNotifications(RemoteMessage? message) {
    if (message == null) return;

    // Navigate to the notifications screen
    // navigatorKey.currentState?.pushNamed(
    //   AppRoutes.kNotificationsScreen,
    //   arguments: message,
    // );
  }
}