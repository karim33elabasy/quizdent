import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/app_assets.dart';
import 'package:quizdent/features/home/domain/entities/event_entity.dart';
import 'package:quizdent/features/home/presentation/widgets/event_details.dart';

class BodyOfEventScreen extends StatelessWidget {
  final EventEntity eventEntity;
  const BodyOfEventScreen({super.key, required this.eventEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 2,
          child: Hero(
            transitionOnUserGestures: true,
            tag: 'event_photo_${eventEntity.id}',
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage(AppAssets.demoImage),
                  fit: BoxFit.fill
                )
              ),
            ),
          ),
        ),
        EventDetails(eventEntity: eventEntity)
      ],
    );
  }
}
