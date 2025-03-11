import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/strings_of_errors.dart';
import 'package:quizdent/core/widgets/dialogs/show_my_dialog.dart';
import 'package:quizdent/core/widgets/loading_widget.dart';
import 'package:quizdent/core/widgets/no_data_widget.dart';
import 'package:quizdent/features/home/presentation/managers/events_cubit/events_cubit.dart';
import 'package:quizdent/features/home/presentation/managers/events_cubit/events_states.dart';
import 'package:quizdent/features/home/presentation/widgets/event_widget.dart';

class EventsListView extends StatelessWidget {
  const EventsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventsCubit, EventsStates>(
      builder: (context, state) {
        if(state is EventsStatesSuccess){
          if(state.events.isEmpty){
            return const NoDataWidget();
          }else{
            return ListView.separated(
              itemBuilder: (context, counter) {
                return EventWidget(eventEntity: state.events[counter],);
              },
              separatorBuilder: (context, counter) =>
              const SizedBox(height: Sizes.xl,),
              itemCount: state.events.length,
            );
          }
        }else{
          return const LoadingWidget();
        }

      },
      listener: (context, state) {
        if(state is EventsStatesFailure){
          ShowMyDialog.showErrorDialog(context: context, title: StringsOfErrors.gettingHomeDataError, message: state.errorMessage);
        }
       },
    );
  }
}
