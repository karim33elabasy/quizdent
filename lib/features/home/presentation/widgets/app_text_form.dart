import 'package:flutter/material.dart';
class AppTextForm extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final IconData? prefixIconData;
  final Widget? suffixIcon;
  final bool? obscureText;
  const AppTextForm({super.key, required this.labelText, required this.controller, this.prefixIconData, this.suffixIcon, this.obscureText, required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      controller: controller,
      obscureText: obscureText ?? false,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIconData),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}
