import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/app_assets.dart';
import 'package:quizdent/features/home/presentation/widgets/event_details.dart';

class BodyOfEventScreen extends StatelessWidget {
  const BodyOfEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 2,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
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
        EventDetails()
      ],
    );
  }
}
