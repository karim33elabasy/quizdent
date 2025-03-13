import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/features/authentication/domain/utilities/user_entity.dart';
import 'package:quizdent/features/home/presentation/managers/manage_events/manage_events_states.dart';
import 'package:quizdent/features/profile/domain/use_cases/update_user_data_use_case.dart';

class ManageEventsCubit extends Cubit<ManageEventsStates> {
  final UpdateUserDataUseCase updateUserDataUseCase;
  ManageEventsCubit({required this.updateUserDataUseCase}):super(ManageEventsStatesInitial());

  updateUserData({required UserEntity userEntity})async{
    emit(ManageEventsStatesLoading());
    var result = await updateUserDataUseCase.call(params: userEntity);
    result.fold(
        (error){emit(ManageEventsStatesFailure(message: error.errorMessage));},
        (success){emit(ManageEventsStatesSuccess());});
  }
}