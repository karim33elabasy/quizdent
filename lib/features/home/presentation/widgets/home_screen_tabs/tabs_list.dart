import 'package:quizdent/core/strings/screen_strings/strings_of_home.dart';
import 'package:quizdent/features/home/presentation/managers/events_cubit/events_cubit.dart';
import 'package:quizdent/features/home/presentation/presentation_models/home_tab_model.dart';
import 'package:quizdent/features/home/presentation/widgets/home_screen_tabs/calendar_tab.dart';
import 'package:quizdent/features/home/presentation/widgets/home_screen_tabs/timeline_tab.dart';
import 'package:quizdent/features/home/presentation/widgets/home_screen_tabs/main_tab.dart';

List<HomeTabModel> homeTabs ({required EventsCubit eventsCubit}){
  return [
    HomeTabModel(
        title: StringsOfHome.homeTab,
        body: MainTab(eventsCubit: eventsCubit,)
    ),
    HomeTabModel(
        title: StringsOfHome.calendarTab,
        body: CalendarTab(eventsCubit: eventsCubit,)
    ),
    HomeTabModel(
        title: StringsOfHome.timelineTab,
        body: TimelineTab(eventsCubit: eventsCubit,)
    ),
  ];
}
