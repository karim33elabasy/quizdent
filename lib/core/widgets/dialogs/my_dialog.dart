import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/sizes.dart';

class MyDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? iconColor;

  const MyDialog({
    super.key,
    required this.title,
    required this.message,
    this.buttonText = 'OK',
    this.onPressed,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: icon != null ? Icon(icon, color: iconColor,size: Sizes.iconLg,) : null,
      title: Text(title,style: Theme.of(context).textTheme.headlineSmall,),
      content: Text(message,style: Theme.of(context).textTheme.bodyMedium,),
      actions: [
        TextButton(
          onPressed: onPressed ?? () => Navigator.pop(context),
          child: Text(buttonText,style: Theme.of(context).textTheme.bodyLarge,),
        ),
      ],
    );
  }
}