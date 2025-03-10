import 'package:flutter/material.dart';
import 'package:quizdent/features/home/presentation/managers/events_cubit/events_cubit.dart';
import 'package:quizdent/features/home/presentation/presentation_models/default_home_tab.dart';
import 'package:random_avatar/random_avatar.dart';

class FavTab extends StatelessWidget {
  final EventsCubit eventsCubit;
  const FavTab ({super.key, required this.eventsCubit});

  @override
  Widget build(BuildContext context) {
    return  DefaultHomeTab(
        body: Column(
            children: [
              RandomAvatar("me"),

            ]
        )
    );
  }
}
