import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:random_avatar/random_avatar.dart';

class TopUserMsgFavScreen extends StatelessWidget {
  final String userPhoto;
  final String userName;

  const TopUserMsgFavScreen({
    super.key,
    required this.userPhoto,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.md),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // User Photo
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: RandomAvatar(
              userPhoto,
              height: 80,
              width: 80,
            ),
          ),
          const SizedBox(width: Sizes.md),
          // Motivational Message and Calendar Hint
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hey $userName! 🎉",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: Sizes.sm),
                Text(
                  "You're doing great! Keep attending events to grow your skills and network. Below are the events you've enrolled in. Don't miss out!",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                ),
                const SizedBox(height: Sizes.sm),
                Text(
                  "📅 Events in your calendar:",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
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