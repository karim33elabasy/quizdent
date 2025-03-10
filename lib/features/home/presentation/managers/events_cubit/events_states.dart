import 'package:quizdent/features/home/domain/entities/event_entity.dart';

abstract class EventsStates {}

class EventsStatesInitial extends EventsStates {}

class EventsStatesSuccess extends EventsStates {
  final List<EventEntity> events;
  EventsStatesSuccess({required this.events});
}

class EventsStatesLoading extends EventsStates {}

class EventsStatesFailure extends EventsStates {
  final String errorMessage;
  EventsStatesFailure({required this.errorMessage});
}