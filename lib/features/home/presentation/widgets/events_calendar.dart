import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/utils/app_routes.dart';
import 'package:quizdent/core/validators_and_helpers/date_time_formatter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:quizdent/features/home/domain/entities/event_entity.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/features/authentication/presentation/manager/auth_bloc/auth_bloc.dart';

class EventsCalendar extends StatefulWidget {
  final List<EventEntity> events;

  const EventsCalendar({
    super.key,
    required this.events,
  });

  @override
  State<EventsCalendar> createState() => _EventsCalendarState();
}

class _EventsCalendarState extends State<EventsCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    final authBloc = context.watch<AuthBloc>();
    final List<EventEntity> userEvents = widget.events
        .where((event) => authBloc.user!.favEvents.contains(event.id))
        .toList();

    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime(DateTime.now().year - 1),
          lastDay: DateTime(DateTime.now().year + 1),
          focusedDay: _focusedDay,
          calendarFormat: calendarFormat,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          onFormatChanged: (format) {
            setState(() {
              calendarFormat = format;
            });
          },
          eventLoader: (day) {
            return widget.events.where((event) => isSameDay(event.date, day)).toList();
          },
          calendarStyle: CalendarStyle(
            weekendTextStyle: const TextStyle(),
            selectedDecoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
          ),
          headerStyle: HeaderStyle(
            formatButtonVisible: true,
            titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          calendarBuilders: CalendarBuilders(
            markerBuilder: (context, date, events) {
              if (events.isNotEmpty) {
                return Positioned(
                  bottom: 4,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _getMarkerColor(date, userEvents),
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: Sizes.lg),
        if (_selectedDay != null) _buildEventList(_selectedDay!, userEvents),
      ],
    );
  }

  /// تحديث لون العلامة بناءً على إذا كان المستخدم مسجّل في الحدث أم لا
  Color _getMarkerColor(DateTime day, List<EventEntity> userEvents) {
    final eventsOnDay = widget.events.where((event) => isSameDay(event.date, day)).toList();
    final userEnrolledEventsOnDay = userEvents.where((event) => isSameDay(event.date, day)).toList();

    if (eventsOnDay.isEmpty) {
      return Colors.transparent;
    } else if (userEnrolledEventsOnDay.isNotEmpty) {
      return AppColors.primary;
    } else {
      return Colors.red;
    }
  }

  Widget _buildEventList(DateTime day, List<EventEntity> userEvents) {
    final events = widget.events.where((event) => isSameDay(event.date, day)).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Events on ${DateTimeFormatter.formatDate(day)}:",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: Sizes.sm),
        ...events.map((event) => ListTile(
          leading: Icon(
            Icons.event,
            color: userEvents.contains(event) ? AppColors.primary : Colors.red,
          ),
          title: Text(event.title),
          subtitle: Text(event.description),
          onTap: () async {
            await Navigator.pushNamed(
              context,
              AppRoutes.kEventScreen,
              arguments: event
            );
            setState(() {});
          },
        )),
      ],
    );
  }
}
