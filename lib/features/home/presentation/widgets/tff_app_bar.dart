import 'package:flutter/material.dart';
import 'package:quizdent/core/strings/strings_of_home.dart';

class TffAppBar extends StatelessWidget {
  const TffAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: StringsOfHome.searchTffSearch,
        prefixIcon: const Icon(Icons.search, color: Colors.blue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
