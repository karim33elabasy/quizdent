import 'package:flutter/material.dart';
import 'package:quizdent/features/home/presentation/managers/events_cubit/events_cubit.dart';
import 'package:quizdent/features/home/presentation/presentation_models/default_home_tab.dart';

class GroupsTab extends StatelessWidget {
  final EventsCubit eventsCubit;
  const GroupsTab ({super.key, required this.eventsCubit});

  @override
  Widget build(BuildContext context) {
    return const DefaultHomeTab(body: Center(child: Text("Home Screen")));
  }
}
