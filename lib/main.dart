import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizdent/app.dart';
import 'package:quizdent/core/utils/notifications_services.dart';
import 'package:quizdent/core/utils/services_locator.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  NotificationsServices.initNotifications();
  await setupLocator();
  runApp( DevicePreview(
    enabled: true,
    builder: (context)=> const App())
  );
}

