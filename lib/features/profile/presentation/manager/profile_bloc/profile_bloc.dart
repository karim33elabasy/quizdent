import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/variables_and_enums/shared_pref_variables.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_events.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_states.dart';

class ProfileBloc extends Bloc<ProfileEvents, ProfileStates> {
  ProfileBloc() : super(ProfileStatesInitial()){
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

  _changeAppLang(ProfileEvents event, Emitter<ProfileStates> emit){
    emit(ProfileStatesUpdateSettingsUI());
  }

  _saveUserInfo(ProfileEvents event, Emitter<ProfileStates> emit){

  }
}