import 'package:flutter/material.dart';
import 'package:quizdent/features/home/presentation/presentation_models/default_home_tab.dart';

class GroupsTab extends StatelessWidget {
  const GroupsTab ({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultHomeTab(body: Center(child: Text("Home Screen")));
  }
}
