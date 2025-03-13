import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/validators_and_helpers/date_time_formatter.dart';

class EventTimeBar extends StatelessWidget {
  final DateTime dateTime;
  final bool? opositeAlign;
  final Color? fontColor;
  const EventTimeBar({super.key, required this.dateTime, this.opositeAlign, this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: opositeAlign==null||opositeAlign==true? MainAxisAlignment.end: MainAxisAlignment.start,
      children: [
        const SizedBox(width: Sizes.sm,),
        Row(
          children: [
            Icon(Icons.date_range,color: fontColor,),
            const SizedBox(width: 5,),
            Text(DateTimeFormatter.formatDate(dateTime),style: Theme.of(context).textTheme.titleSmall?.copyWith(color: fontColor),)
          ],
        ),
        const SizedBox(width: 20,),
        Row(
          children: [
            Icon(Icons.timer_sharp,color: fontColor,),
            const SizedBox(width: 5,),
            Text(DateTimeFormatter.formatTime(dateTime),style: Theme.of(context).textTheme.titleSmall?.copyWith(color: fontColor))
          ],
        ),
        const SizedBox(width: Sizes.sm,)
      ],
    );
  }
}
