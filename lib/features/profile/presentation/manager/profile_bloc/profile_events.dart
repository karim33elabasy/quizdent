import 'package:quizdent/features/authentication/domain/utilities/user_entity.dart';

abstract class ProfileEvents{}

class ProfileEventsChangeDarkMode extends ProfileEvents{
  final bool isDarkMode;
  ProfileEventsChangeDarkMode({required this.isDarkMode});
}

class ProfileEventsUpdateSettingsUI extends ProfileEvents{

}

class ProfileEventsSaveUserInfo extends ProfileEvents{
  final UserEntity userEntity;
  ProfileEventsSaveUserInfo({required this.userEntity});
}