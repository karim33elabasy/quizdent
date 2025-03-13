import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/features/authentication/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:quizdent/features/home/presentation/managers/events_cubit/events_cubit.dart';
import 'package:quizdent/features/home/presentation/managers/events_cubit/events_states.dart';
import 'package:quizdent/features/home/presentation/widgets/timeline_date_header.dart';
import 'package:quizdent/features/home/presentation/widgets/timeline_event_card.dart';
import 'package:quizdent/features/home/presentation/widgets/top_user_msg_fav_screen.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:table_calendar/table_calendar.dart';

class TimelineTab extends StatelessWidget {
  final EventsCubit eventsCubit;
  const TimelineTab({super.key, required this.eventsCubit});

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.read<AuthBloc>();

    return BlocBuilder<EventsCubit, EventsStates>(
      builder: (context, state) {
        if (state is EventsStatesSuccess) {
          // Filter events to show only those the user has enrolled in
          final enrolledEvents = state.events
              .where((event) => authBloc.user!.favEvents.contains(event.id))
              .toList();

          // Sort events by date (ascending)
          enrolledEvents.sort((a, b) => a.date.compareTo(b.date));

          // Filter events starting from today
          final today = DateTime(2025, 1, 1); // Replace with DateTime.now() for real usage
          final upcomingEvents = enrolledEvents
              .where((event) => event.date.isAfter(today) || isSameDay(event.date, today))
              .toList();

          return Column(
            children: [
              TopUserMsgFavScreen(
                userName: authBloc.user!.firstName,
                userPhoto: authBloc.user!.profilePicture,
              ),
              Expanded(
                child: upcomingEvents.isEmpty
                    ? Center(
                  child: Text(
                    "No events yet",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                )
                    : ListView.builder(
                  padding: const EdgeInsets.all(Sizes.md),
                  itemCount: upcomingEvents.length,
                  itemBuilder: (context, index) {
                    final event = upcomingEvents[index];
                    final isFirst = index == 0;
                    final isLast = index == upcomingEvents.length - 1;

                    return Column(
                      children: [
                        // Add a date header if this is the first event or the date has changed
                        if (isFirst || !isSameDay(event.date, upcomingEvents[index - 1].date))
                          TimelineDateHeader(date: event.date),
                        TimelineEventCard(
                          event: event,
                          isFirst: isFirst,
                          isLast: isLast,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}