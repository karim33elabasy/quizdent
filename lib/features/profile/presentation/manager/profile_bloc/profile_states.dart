abstract class ProfileStates{}

class ProfileStatesInitial extends ProfileStates{}

class ProfileStatesDarkMode extends ProfileStates{
  final bool isDarkMode;
  ProfileStatesDarkMode({required this.isDarkMode});
}
