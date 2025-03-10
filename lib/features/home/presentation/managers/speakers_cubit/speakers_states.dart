import 'package:quizdent/features/home/domain/entities/speaker_entity.dart';

abstract class SpeakersStates {}

class SpeakersStatesInitial extends SpeakersStates {}

class SpeakersStatesSuccess extends SpeakersStates {
  final List<SpeakerEntity> speakers;
  SpeakersStatesSuccess({required this.speakers});
}

class SpeakersStatesLoading extends SpeakersStates {}

class SpeakersStatesFailure extends SpeakersStates {
  final String errorMessage;
  SpeakersStatesFailure({required this.errorMessage});
}