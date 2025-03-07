import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/app_assets.dart';

class SpeakerWidget extends StatelessWidget {
  final String speakerName;
  final String speakerRole;

  const SpeakerWidget({
    super.key,
    required this.speakerName,
    required this.speakerRole,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surface, // Adapts to theme mode
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.1), // Dynamic shadow
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Speaker Image
          CircleAvatar(
            radius: width * 0.1, // Adjust size based on screen width
            backgroundImage: const AssetImage(AppAssets.demoImage),
          ),
          const SizedBox(width: 12), // Space between image & text

          // Speaker Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  speakerName,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface, // Adapts to light/dark mode
                  ),
                ),
                Text(
                  speakerRole,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant, // Softer contrast
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
