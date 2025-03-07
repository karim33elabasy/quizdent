import 'package:flutter/material.dart';

class MyTff extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final Widget? suffixIcon;
  const MyTff({super.key, required this.label, this.validator, required this.controller, this.obscureText, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText?? false,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        label: Text(label,style: Theme.of(context).textTheme.bodyLarge,),
        suffixIcon: suffixIcon
      ),
    );
  }
}
