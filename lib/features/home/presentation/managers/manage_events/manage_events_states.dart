abstract class ManageEventsStates{}

class ManageEventsStatesInitial extends ManageEventsStates {}

class ManageEventsStatesLoading extends ManageEventsStates{}

class ManageEventsStatesSuccess extends ManageEventsStates{}

class ManageEventsStatesFailure extends ManageEventsStates{
  final String message;
  ManageEventsStatesFailure({required this.message});
}