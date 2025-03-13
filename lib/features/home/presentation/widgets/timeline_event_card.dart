import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:quizdent/features/home/domain/entities/event_entity.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/validators_and_helpers/date_time_formatter.dart';

class TimelineEventCard extends StatelessWidget {
  final EventEntity event;
  final bool isFirst;
  final bool isLast;

  const TimelineEventCard({
    super.key,
    required this.event,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.start,
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: const LineStyle(
        color: AppColors.primary,
      ),
      indicatorStyle: IndicatorStyle(
        width: 30,
        color: AppColors.primary,
        iconStyle: IconStyle(
          iconData: Icons.event,
          color: Colors.white,
        ),
      ),
      endChild: Padding(
        padding: const EdgeInsets.all(Sizes.md),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(Sizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: Sizes.sm),
                Text(
                  event.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: Sizes.sm),
                Text(
                  "Time: ${DateTimeFormatter.formatTime(event.date)}",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                const SizedBox(height: Sizes.sm),
                Text(
                  "Location: ${event.location}",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}