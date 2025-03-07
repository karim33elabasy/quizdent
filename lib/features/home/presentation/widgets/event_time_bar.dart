import 'package:flutter/material.dart';
import 'package:quizdent/core/validators_and_helpers/date_time_formatter.dart';

class EventTimeBar extends StatelessWidget {
  final DateTime dateTime;
  final bool? opositeAlign;
  const EventTimeBar({super.key, required this.dateTime, this.opositeAlign});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: opositeAlign==null||opositeAlign==true? MainAxisAlignment.end: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.date_range),
            const SizedBox(width: 5,),
            Text(DateTimeFormatter.formatDate(dateTime),style: Theme.of(context).textTheme.titleSmall,)
          ],
        ),
        const SizedBox(width: 20,),
        Row(
          children: [
            const Icon(Icons.timer_sharp),
            const SizedBox(width: 5,),
            Text(DateTimeFormatter.formatTime(dateTime),style: Theme.of(context).textTheme.titleSmall)
          ],
        ),
      ],
    );
  }
}
