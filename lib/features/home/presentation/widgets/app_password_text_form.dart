import 'package:flutter/material.dart';
import 'app_text_form.dart';

class AppPasswordTextForm extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  late bool passwordVisibilityVariable = false;
  AppPasswordTextForm({super.key, required this.labelText, required this.controller, required this.validator,});

  @override
  Widget build(BuildContext context) {

    return AppTextForm(
      labelText: labelText,
      controller: controller,
      obscureText: passwordVisibilityVariable,
      validator: validator,
      prefixIconData: Icons.password,
      suffixIcon: IconButton(
        onPressed: (){
          passwordVisibilityVariable = !passwordVisibilityVariable;
        },
        icon: passwordVisibilityVariable? Icon(Icons.visibility) : Icon(Icons.visibility_off),
      ),
    );
  }
}
