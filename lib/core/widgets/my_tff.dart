import 'package:flutter/material.dart';

class MyTff extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;

  const MyTff({
    super.key,
    required this.label,
    this.validator,
    required this.controller,
    this.obscureText,
    this.suffixIcon,
    this.maxLines,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        obscureText: obscureText ?? false,
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        minLines: minLines,
        decoration: InputDecoration(
          label: Text(label, style: Theme.of(context).textTheme.bodyLarge),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}