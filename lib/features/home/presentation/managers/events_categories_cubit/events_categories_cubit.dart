import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/features/home/domain/usecases/get_events_categories_use_case.dart';
import 'events_ctegories_states.dart';

class EventsCategoriesCubit extends Cubit<EventsCategoriesStates>{
  final GetEventsCategoriesUseCase getEventsCategoriesUseCase;
  EventsCategoriesCubit({required this.getEventsCategoriesUseCase}):super(EventsCategoriesStatesInitial());

  getEventsCategories()async{
   emit(EventsCategoriesStatesLoading());
   var result = await getEventsCategoriesUseCase.call(params: null);
   result.fold(
     (error){
       emit(EventsCategoriesStatesFailure(errorMessage: error.errorMessage));
       },
     (eventsCategories){
           emit(EventsCategoriesStatesSuccess(eventsCategories: eventsCategories));
     }
   );
  }
}