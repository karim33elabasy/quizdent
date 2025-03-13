import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/features/home/presentation/managers/events_cubit/events_cubit.dart';
import 'package:quizdent/features/home/presentation/managers/events_cubit/events_states.dart';
import 'package:quizdent/features/home/presentation/presentation_models/default_home_tab.dart';
import 'package:quizdent/features/home/presentation/widgets/events_calendar.dart';

class CalendarTab extends StatelessWidget {
  final EventsCubit eventsCubit;
  const CalendarTab ({super.key, required this.eventsCubit});

  @override
  Widget build(BuildContext context) {
    return  DefaultHomeTab(
        body: SingleChildScrollView(
          child: Column(
              children: [
                BlocBuilder<EventsCubit,EventsStates>(
                    builder: (context,state){
                      if(state is EventsStatesSuccess){
                        return EventsCalendar(events: state.events);
                      }else{
                        return const CircularProgressIndicator();
                      }
                    }
                )
              ]
          ),
        )
    );
  }
}