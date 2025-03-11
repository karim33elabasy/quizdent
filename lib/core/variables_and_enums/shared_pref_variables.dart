import 'package:quizdent/core/utils/shared_pref_services.dart';

abstract class SharedPrefVariables {
  static const String kIsDarkMode = "kIsDarkMode";

  static bool _isDarkMode = false;
  static bool get isDarkMode {
    if(SharedPrefServices.getBool(kIsDarkMode)==null){
      SharedPrefServices.setBool(kIsDarkMode, false);
      return _isDarkMode;
    }else{
      return SharedPrefServices.getBool(kIsDarkMode)!;
    }
  }
  static set isDarkMode(bool value) {
    _isDarkMode = value;
    SharedPrefServices.setBool(kIsDarkMode, _isDarkMode);
  }
}