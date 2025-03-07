import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/widgets/my_button.dart';
import 'package:quizdent/features/home/presentation/widgets/body_of_event_screen.dart';
import 'package:quizdent/features/home/presentation/widgets/speaker_widget.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Event Details",style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22,color: AppColors.white),),
        backgroundColor: AppColors.primary,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_rounded,color: Colors.white,)),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.share,color: AppColors.white,))
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          vertical: Sizes.sm,
          horizontal: Sizes.sm,
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: 30,
            children: [
              BodyOfEventScreen(),
              SpeakerWidget(speakerName: "Karim Adel",speakerRole: "PHD Computer Science",),
              SpeakerWidget(speakerName: "Karim Adel",speakerRole: "PHD Computer Science",),
              SpeakerWidget(speakerName: "Karim Adel",speakerRole: "PHD Computer Science",),
              MyButton(onPressed: (){}, title: "Enroll Now", isBlue: true)
            ],
          ),
        ),
      ),
    );
  }
}
