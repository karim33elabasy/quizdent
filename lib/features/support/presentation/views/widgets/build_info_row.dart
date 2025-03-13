import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/sizes.dart';

class BuildInfoRow extends StatelessWidget {
  final String label;
  final String value;
  const BuildInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.sm),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
