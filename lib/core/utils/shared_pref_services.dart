import 'package:quizdent/core/utils/services_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefServices {
  static final SharedPreferences _sharedPreferences = getIt();

  static Future<void> setBool(String key, bool value) async {
    await _sharedPreferences.setBool(key, value);
  }

  static bool? getBool(String key) {
    return _sharedPreferences.getBool(key);
  }

  static Future<void> setString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  static String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  static Future<void> setInt(String key, int value) async {
    await _sharedPreferences.setInt(key, value);
  }

  static int? getInt(String key) {
    return _sharedPreferences.getInt(key);
  }

  static Future<void> setDouble(String key, double value) async {
    await _sharedPreferences.setDouble(key, value);
  }

  static double? getDouble(String key) {
    return _sharedPreferences.getDouble(key);
  }

  static  Future<void> remove(String key) async {
    await _sharedPreferences.remove(key);
  }

  static Future<void> clear() async {
    await _sharedPreferences.clear();
  }
}
