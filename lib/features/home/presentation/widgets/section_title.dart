import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String sectionTitle;
  const SectionTitle({super.key, required this.sectionTitle});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 15,
      ),
      child: Text(
        sectionTitle,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        )
      ).tr(),
    );
  }
}
