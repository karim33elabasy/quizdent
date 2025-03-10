import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_event_screen.dart';
import 'package:quizdent/core/widgets/my_button.dart';
import 'package:quizdent/core/widgets/section_title.dart';
import 'package:quizdent/features/home/domain/entities/event_entity.dart';
import 'package:quizdent/features/home/presentation/widgets/body_of_event_screen.dart';
import 'package:quizdent/features/home/presentation/widgets/speakers_section.dart';

class EventScreen extends StatelessWidget {
  final EventEntity eventEntity;
  const EventScreen({super.key, required this.eventEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(StringsOfEventsScreen.eventScreenTitle,style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22,color: AppColors.white),),
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
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 30,
                  children: [
                    BodyOfEventScreen(eventEntity: eventEntity,),
                    const SectionTitle(sectionTitle: StringsOfEventsScreen.speakersTitle),
                    SpeakersSection(eventEntity: eventEntity),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            MyButton(onPressed: (){}, title: StringsOfEventsScreen.enrollBtn, isBlue: true)
          ],
        ),
      ),
    );
  }
}
