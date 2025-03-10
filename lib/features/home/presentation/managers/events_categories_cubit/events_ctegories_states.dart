import 'package:quizdent/features/home/domain/entities/event_category_entity.dart';

abstract class EventsCategoriesStates {}

class EventsCategoriesStatesInitial extends EventsCategoriesStates {}

class EventsCategoriesStatesSuccess extends EventsCategoriesStates {
  final List<EventCategoryEntity> eventsCategories;
  EventsCategoriesStatesSuccess({required this.eventsCategories});
}

class EventsCategoriesStatesLoading extends EventsCategoriesStates {}

class EventsCategoriesStatesFailure extends EventsCategoriesStates {
  final String errorMessage;
  EventsCategoriesStatesFailure({required this.errorMessage});
}