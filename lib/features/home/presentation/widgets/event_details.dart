import 'package:flutter/material.dart';
import 'package:quizdent/features/home/domain/entities/event_entity.dart';
import 'package:quizdent/features/home/presentation/widgets/event_time_bar.dart';

class EventDetails extends StatelessWidget {
  final EventEntity eventEntity;
  const EventDetails({super.key, required this.eventEntity,});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Text(eventEntity.title,style: Theme.of(context).textTheme.displaySmall,maxLines: 4,overflow: TextOverflow.ellipsis,),
        EventTimeBar(dateTime: DateTime.now(),opositeAlign: true,),
        Text(eventEntity.subtitle,style: Theme.of(context).textTheme.titleMedium,maxLines: 30,overflow: TextOverflow.ellipsis,),
        const Divider(),
        Text(eventEntity.description,style: Theme.of(context).textTheme.titleLarge,),
      ],
    );
  }
}
