import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/features/home/presentation/widgets/event_widget.dart';

class EventsListView extends StatelessWidget {
  const EventsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context,counter)=> EventWidget(),
      separatorBuilder: (context,counter)=> const SizedBox(height: Sizes.xl,),
      itemCount: 10,
    );
  }
}
