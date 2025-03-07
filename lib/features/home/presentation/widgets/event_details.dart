import 'package:flutter/material.dart';
import 'package:quizdent/features/home/presentation/widgets/event_time_bar.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Text("title "*10,style: Theme.of(context).textTheme.displaySmall,),
        EventTimeBar(dateTime: DateTime.now(),opositeAlign: true,),
        Text("description "*20,style: Theme.of(context).textTheme.titleMedium,),
        Divider(),
        Text("body "*120,style: Theme.of(context).textTheme.titleLarge,),
      ],
    );
  }
}
