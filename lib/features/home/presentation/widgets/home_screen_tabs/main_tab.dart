import 'package:flutter/material.dart';
import 'package:quizdent/core/widgets/section_title.dart';
import 'package:quizdent/features/home/presentation/presentation_models/default_home_tab.dart';
import 'package:quizdent/features/home/presentation/widgets/events_list_view.dart';
import 'package:quizdent/features/home/presentation/widgets/filter_chips.dart';

class MainTab extends StatelessWidget {
  const MainTab ({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultHomeTab(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilterChips(),
          SectionTitle(sectionTitle: "Current Events"),
          Expanded(
            child: EventsListView()
          )
        ],
      )
    );
  }
}
