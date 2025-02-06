import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/widgets/my_button.dart';

class MyLoadingButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final void Function() onPressed;
  const MyLoadingButton({super.key, required this.isLoading, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: onPressed,
      title: title,
      isBlue: true,

      child: isLoading? const SizedBox(
        width: Sizes.md,
        height: Sizes.md,
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ):null,
    );
  }
}
