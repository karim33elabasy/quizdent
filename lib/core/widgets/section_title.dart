import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String sectionTitle;
  final CrossAxisAlignment? crossAxisAlignment;
  const SectionTitle({super.key, required this.sectionTitle, this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment?? CrossAxisAlignment.start,
      children: [
        const Divider(),
        Text(
          sectionTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
