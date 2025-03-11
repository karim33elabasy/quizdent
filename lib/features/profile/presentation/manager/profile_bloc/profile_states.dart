abstract class ProfileStates{}

class ProfileStatesInitial extends ProfileStates{}

class ProfileStatesDarkMode extends ProfileStates{
  final bool isDarkMode;
  ProfileStatesDarkMode({required this.isDarkMode});
}

class ProfileStatesLoading extends ProfileStates{}

class ProfileStatesFailure extends ProfileStates{
  final String message;
  ProfileStatesFailure({required this.message});
}

class ProfileStatesUpdateSettingsUI extends ProfileStates{}
