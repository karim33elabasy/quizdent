import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizdent/app.dart';
import 'package:quizdent/core/utils/dependency_injection.dart';
import 'core/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupDependencyInjection();
  runApp( DevicePreview(
    enabled: true,
    builder: (context)=> const App())
  );
}

