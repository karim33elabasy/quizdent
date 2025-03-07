import 'package:quizdent/core/strings/strings_of_home.dart';
import 'package:quizdent/features/home/presentation/presentation_models/home_tab_model.dart';
import 'package:quizdent/features/home/presentation/widgets/home_screen_tabs/fav_tab.dart';
import 'package:quizdent/features/home/presentation/widgets/home_screen_tabs/groups_tab.dart';
import 'package:quizdent/features/home/presentation/widgets/home_screen_tabs/main_tab.dart';

final List<HomeTabModel> homeTabs = [
  HomeTabModel(
    title: StringsOfHome.homeTab,
    body: const MainTab()
  ),
  HomeTabModel(
      title: StringsOfHome.favTab,
      body: const FavTab()
  ),
  HomeTabModel(
      title: StringsOfHome.groupsTab,
      body: const GroupsTab()
  ),
];