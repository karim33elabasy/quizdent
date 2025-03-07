import 'package:flutter/material.dart';
import 'package:quizdent/features/authentication/presentation/auth_screen.dart';
import 'package:quizdent/features/home/presentation/event_screen.dart';
import 'package:quizdent/features/home/presentation/home_screen.dart';

abstract class AppRoutes{
  static const kAuthScreen = 'kAuthScreen';
  static const kHomeScreen = 'kHomeScreen';
  static const kEventScreen = 'kEventScreen';
  static Map<String, Widget Function(BuildContext)> appRoutes = {
    kAuthScreen : (context)=> const AuthScreen(),
    kHomeScreen : (context)=> const HomeScreen(),
    kEventScreen : (context)=> const EventScreen(),
  };
}