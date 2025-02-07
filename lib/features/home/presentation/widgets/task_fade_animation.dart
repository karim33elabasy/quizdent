import 'package:flutter/material.dart';

class TaskFadeAnimation extends PageRouteBuilder{
  // Class that extends PageRouteBuilder to create custom navigation widget to be used in navigation
  final Widget screen; // Screen You want to navigate to it
  final Duration? animationDuration; // Duration of the transition
  @override
  TaskFadeAnimation({required this.screen, this.animationDuration}):super(
    //Building the fade transition
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
      opacity: Tween(begin: 0.1, end: 1.0).animate(animation),
      child: child,
    ),
    transitionDuration: animationDuration ?? const Duration(milliseconds: 300),
  );
}