import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/app_colors.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Widget? child;
  final void Function() onPressed;
  final bool isBlue;
  const MyButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.isBlue,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isBlue ? AppColors.primary : AppColors.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: child ?? Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: isBlue ? AppColors.white : AppColors.black,),
      )
    );
  }
}