import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/variables_and_enums/shared_pref_variables.dart';
import 'package:quizdent/features/authentication/domain/utilities/user_entity.dart';
import 'package:quizdent/features/authentication/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:quizdent/features/authentication/presentation/manager/auth_bloc/auth_event.dart';
import 'package:quizdent/features/profile/domain/use_cases/update_user_data_use_case.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_events.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_states.dart';

class ProfileBloc extends Bloc<ProfileEvents, ProfileStates> {
  final UpdateUserDataUseCase updateUserDataUseCase;
  final AuthBloc authBloc;
  ProfileBloc({required this.updateUserDataUseCase, required this.authBloc}) : super(ProfileStatesInitial()){
    on<ProfileEventsChangeDarkMode>(_changeDarkMode);
    on<ProfileEventsUpdateSettingsUI>(_changeAppLang);
    on<ProfileEventsSaveUserInfo>(_saveUserInfo);

  }

  late Map<String,dynamic> currentUserDataToEdit;

  _changeDarkMode(ProfileEventsChangeDarkMode event, Emitter<ProfileStates> emit){
    try{
      bool isDarkMode = event.isDarkMode;
      SharedPrefVariables.isDarkMode=isDarkMode;
      emit(ProfileStatesDarkMode(isDarkMode: isDarkMode));
    }catch(e){
      emit(ProfileStatesFailure(message: e.toString()));
    }
  }

  _changeAppLang(ProfileEventsUpdateSettingsUI event, Emitter<ProfileStates> emit){
    emit(ProfileStatesUpdateSettingsUI());
  }

  _saveUserInfo(ProfileEventsSaveUserInfo event, Emitter<ProfileStates> emit)async{
    emit(ProfileStatesLoading());
    final result = await updateUserDataUseCase.call(params: event.userEntity);
    result.fold(
      (error) => emit(ProfileStatesFailure(message: error.toString())),
      (success) {
        authBloc.add(UpdateUserEntity(userEntity: UserEntity.fromJson(currentUserDataToEdit)));
        return emit(ProfileStatesSavedUserInfoSuccess());
      }
    );
  }
}