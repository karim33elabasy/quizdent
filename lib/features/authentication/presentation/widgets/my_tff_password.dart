import 'package:flutter/material.dart';
import 'package:quizdent/core/widgets/my_tff.dart';

class MyTffPassword extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?) validator;
  const MyTffPassword({super.key, required this.label, required this.controller, required this.validator});

  @override
  State<MyTffPassword> createState() => _MyTffPasswordState();
}

class _MyTffPasswordState extends State<MyTffPassword> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return MyTff(
      minLines: 1,
      maxLines: 1,
      label: widget.label,
      controller: widget.controller,
      obscureText: obscureText,
      validator: widget.validator,
      suffixIcon: IconButton(
        onPressed: (){
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(obscureText? Icons.visibility:Icons.visibility_off)
      ),
    );
  }
}
