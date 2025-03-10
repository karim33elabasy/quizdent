import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_events.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_states.dart';

class ProfileBloc extends Bloc<ProfileEvents, ProfileStates> {
  ProfileBloc() : super(ProfileStatesInitial()){
    on<ProfileEvent> (event) {
      on<ProfileEventsChangeDarkMode>(_changeDarkMode);
      on<ProfileEventsChangeAppLang>(_changeAppLang);
      on<ProfileEventsSaveUserInfo>(_saveUserInfo);
    }

  }

  _changeDarkMode(ProfileEvents event, Emitter<ProfileStates> emit){

  }

  _changeAppLang(ProfileEvents event, Emitter<ProfileStates> emit){

  }

  _saveUserInfo(ProfileEvents event, Emitter<ProfileStates> emit){

  }
}