import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_home.dart';
import 'package:quizdent/features/home/domain/usecases/get_events_use_case.dart';
import 'package:quizdent/features/home/domain/usecases/search_events_use_case.dart';
import 'events_states.dart';

class EventsCubit extends Cubit<EventsStates> {
  final GetEventsUseCase getEventsUseCase;
  final SearchEventsUseCase searchEventsUseCase;

  EventsCubit({required this.getEventsUseCase, required this.searchEventsUseCase}) : super(EventsStatesInitial());

  final TextEditingController searchTEC = TextEditingController();
  final List<String> _categoriesFilter = [StringsOfHome.filterChipAll];

  List<String> get categoriesFilter => List.unmodifiable(_categoriesFilter);

  void addCategoryFilter(String category) {
    if (category == StringsOfHome.filterChipAll) {
      _categoriesFilter
        ..clear()
        ..add(StringsOfHome.filterChipAll);
    } else {
      _categoriesFilter.remove(StringsOfHome.filterChipAll);
      if (!_categoriesFilter.contains(category)) {
        _categoriesFilter.add(category);
      }
    }
    getEvents();
  }

  resetCategoriesList(){
    _categoriesFilter.clear();
    _categoriesFilter.add(StringsOfHome.filterChipAll);
  }

  void removeCategoryFilter(String category) {
    _categoriesFilter.remove(category);
    if (_categoriesFilter.isEmpty) {
      _categoriesFilter.add(StringsOfHome.filterChipAll);
    }
    getEvents();
  }

  Future<void> getEvents() async {
    emit(EventsStatesLoading());
    var result = await getEventsUseCase.call(params: _categoriesFilter);
    result.fold(
          (error) => emit(EventsStatesFailure(errorMessage: error.errorMessage)),
          (events) => emit(EventsStatesSuccess(events: events)),
    );
  }

  Future<void> searchEvents() async {
    resetCategoriesList();
    emit(EventsStatesLoading());
    var result = await searchEventsUseCase.call(params: searchTEC.text);
    result.fold(
          (error) => emit(EventsStatesFailure(errorMessage: error.errorMessage)),
          (events) => emit(EventsStatesSuccess(events: events)),
    );
  }
}
