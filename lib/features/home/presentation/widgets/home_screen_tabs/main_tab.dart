import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_home.dart';
import 'package:quizdent/core/widgets/section_title.dart';
import 'package:quizdent/features/home/presentation/managers/events_cubit/events_cubit.dart';
import 'package:quizdent/features/home/presentation/presentation_models/default_home_tab.dart';
import 'package:quizdent/features/home/presentation/widgets/events_list_view.dart';
import 'package:quizdent/features/home/presentation/widgets/filter_chips_states.dart';
import 'package:quizdent/features/home/presentation/widgets/tff_search_events.dart';

class MainTab extends StatelessWidget {
  final EventsCubit eventsCubit;
  const MainTab ({super.key, required this.eventsCubit});

  @override
  Widget build(BuildContext context) {
    return  const DefaultHomeTab(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpansionTile(
            title: Text(StringsOfHome.currentEvents),
            children: [
              SizedBox(
                height: 50,
                child: FilterChipsStates()
              ),
              SizedBox(height: Sizes.sm,),
              TffSearchEvents(),
              SizedBox(height: Sizes.sm,),
            ],
          ),
          // SectionTitle(sectionTitle: "Current Events"),
          Expanded(
            child: EventsListView()
          )
        ],
      )
    );
  }
}
