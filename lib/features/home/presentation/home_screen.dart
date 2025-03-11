import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_home.dart';
import 'package:quizdent/core/strings/strings_of_errors.dart';
import 'package:quizdent/core/utils/app_routes.dart';
import 'package:quizdent/core/widgets/dialogs/show_my_dialog.dart';
import 'package:quizdent/features/authentication/data/models/user_model.dart';
import 'package:quizdent/features/home/presentation/widgets/home_screen_tabs/tabs_list.dart';
import 'managers/events_cubit/events_cubit.dart';
import 'managers/events_cubit/events_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EventsCubit eventsCubit = context.read<EventsCubit>();
    final homeTabsList = homeTabs(eventsCubit: eventsCubit);
    return DefaultTabController(
      length: homeTabsList.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){}, icon: const Icon(Icons.menu,color: AppColors.white,)),
          actions: [
            IconButton(onPressed: (){Navigator.pushNamed(context, AppRoutes.kProfileScreen,arguments: UserModel.fake());}, icon: const Icon(Icons.notifications,color: AppColors.white,)),
          ],
          centerTitle: true,
          backgroundColor: AppColors.primary,
          title: Text(StringsOfHome.homeTitle,style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22,color: AppColors.white),),
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: homeTabsList.map((item) => Tab(text: item.title,)).toList(),
          ),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(
            vertical: Sizes.md,
            horizontal: Sizes.md,
          ),
          child: BlocConsumer<EventsCubit,EventsStates>(
            builder: (context, state) {
              return TabBarView(
                children: homeTabsList.map((item) => item.body).toList(),
              );
            },
            listener: (context,state){
              if(state is EventsStatesFailure) ShowMyDialog.showErrorDialog(context: context, title: StringsOfErrors.gettingHomeDataError, message: state.errorMessage);
            },
          ),
        ),
      ),
    );
  }
}