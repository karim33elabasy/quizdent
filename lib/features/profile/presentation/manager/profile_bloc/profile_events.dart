import 'package:quizdent/features/home/domain/entities/event_entity.dart';

abstract class ProfileEvents{}

class ProfileEventsChangeDarkMode extends ProfileEvents{
  final bool isDarkMode;
  ProfileEventsChangeDarkMode({required this.isDarkMode});
}

class ProfileEventsChangeAppLang extends ProfileEvents{

}

class ProfileEventsSaveUserInfo extends ProfileEvents{
  final EventEntity eventEntity;
  ProfileEventsSaveUserInfo({required this.eventEntity});
}