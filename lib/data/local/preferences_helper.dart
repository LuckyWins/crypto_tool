import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {

  static Future<bool> getAuthWithBiometrics() {
    return _getBool(_authWithBiometrics);
  }

  static Future<bool> setAuthWithBiometrics(bool value) {
    return _setBool(_authWithBiometrics, value);
  }

  /// get/set for different types

  static Future<bool> _getBool(String key) async {
    var prefs = await _load();
    return prefs.getBool(key);
  }

  static Future<bool> _setBool(String key, bool value) async {
    var prefs = await _load();
    return prefs.setBool(key, value);
  }

  static Future<SharedPreferences> _load() async {
    return await SharedPreferences.getInstance();
  }

  //keys
  static const _authWithBiometrics = "authwithbiometrics";
}