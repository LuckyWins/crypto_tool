import 'package:cryptotool/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {

  static Future<BynToUsdExchangeSource> getBynToUsdExchangeSource() async {
    Map<int, BynToUsdExchangeSource> _map = {
      0: BynToUsdExchangeSource.alfabank,
      1: BynToUsdExchangeSource.nbrb,
      2: BynToUsdExchangeSource.manually
    };
    int value = await _getInt(_bynToUsdExchangeSource) ?? 0;
    return _map[value];
  }

  static Future<bool> setBynToUsdExchangeSource(BynToUsdExchangeSource value) {
    Map<BynToUsdExchangeSource, int> _map = {
      BynToUsdExchangeSource.alfabank: 0,
      BynToUsdExchangeSource.nbrb: 1,
      BynToUsdExchangeSource.manually: 2
    };
    return _setInt(_bynToUsdExchangeSource, _map[value]);
  }

  static Future<double> getBynToUsdExchangeRate() {
    return _getDouble(_bynToUsdExchangeRate) ?? 0;
  }

  static Future<bool> setBynToUsdExchangeRate(double value) {
    return _setDouble(_bynToUsdExchangeRate, value);
  }

  /// get/set for different types
  
  static Future<int> _getInt(String key) async {
    var prefs = await _load();
    return prefs.getInt(key);
  }

  static Future<bool> _setInt(String key, int value) async {
    var prefs = await _load();
    return prefs.setInt(key, value);
  }

  static Future<double> _getDouble(String key) async {
    var prefs = await _load();
    return prefs.getDouble(key);
  }

  static Future<bool> _setDouble(String key, double value) async {
    var prefs = await _load();
    return prefs.setDouble(key, value);
  }

  static Future<SharedPreferences> _load() async {
    return await SharedPreferences.getInstance();
  }

  //keys
  static const _bynToUsdExchangeSource = "byntousdexchangeource";
  static const _bynToUsdExchangeRate = "byntousdexchangerate";
}