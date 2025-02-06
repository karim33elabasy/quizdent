import 'package:flutter/material.dart';

class MyTff extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const MyTff({super.key, required this.label, this.validator, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        label: Text(label,style: Theme.of(context).textTheme.bodyLarge,),
      ),
    );
  }
}
