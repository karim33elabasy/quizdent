import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/strings/strings_of_errors.dart';
import 'package:quizdent/core/widgets/dialogs/show_my_dialog.dart';
import 'package:quizdent/core/widgets/loading_widget.dart';
import 'package:quizdent/core/widgets/no_data_widget.dart';
import 'package:quizdent/features/home/domain/entities/event_entity.dart';
import 'package:quizdent/features/home/domain/entities/speaker_entity.dart';
import 'package:quizdent/features/home/presentation/managers/speakers_cubit/speakers_cubit.dart';
import 'package:quizdent/features/home/presentation/managers/speakers_cubit/speakers_states.dart';
import 'package:quizdent/features/home/presentation/widgets/speaker_widget.dart';

class SpeakersSection extends StatelessWidget {
  final EventEntity eventEntity;
  const SpeakersSection({super.key, required this.eventEntity});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SpeakersCubit,SpeakersStates>(
      builder: (context,state){
        if(state is SpeakersStatesSuccess){
          List<SpeakerEntity> eventSpeakers = state.speakers
              .where((speaker) => eventEntity.speakers.contains(speaker.id))
              .toList();
          if(state.speakers.isEmpty){
            return const NoDataWidget();
          }else{
            return Column(
              spacing: 20,
              children: eventSpeakers.map((speaker)=>SpeakerWidget(speakerEntity: speaker)).toList(),);
          }
        }else{
          return const LoadingWidget();
        }
      },
      listener: (context,state){
        if(state is SpeakersStatesFailure){
          ShowMyDialog.showErrorDialog(context: context, title: StringsOfErrors.gettingSpeakersError, message: state.errorMessage);
        }
      }
    );
  }
}
