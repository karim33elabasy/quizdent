import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/validators_and_helpers/date_time_formatter.dart';

class TimelineDateHeader extends StatelessWidget {
  final DateTime date;

  const TimelineDateHeader({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
      margin: const EdgeInsets.only(bottom: Sizes.sm),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        DateTimeFormatter.formatDate(date),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }
}