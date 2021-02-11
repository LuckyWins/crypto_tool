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

  static Future<double> getBynToUsdExchangeRate() async {
    return await _getDouble(_bynToUsdExchangeRate) ?? 0;
  }

  static Future<bool> setBynToUsdExchangeRate(double value) {
    return _setDouble(_bynToUsdExchangeRate, value);
  }

  static Future<SortOptions> getSortOption() async {
    Map<int, SortOptions> _map = {
      0: SortOptions.cardPriceAsc,
      1: SortOptions.cardPriceDesc,
      2: SortOptions.paybackDesc,
      3: SortOptions.paybackAsc,
      4: SortOptions.dailyUsdDesc,
      5: SortOptions.dailyUsdAsc,
      6: SortOptions.none
    };
    int value = await _getInt(_sortOption) ?? 6;
    return _map[value];
  }

  static Future<bool> setSortOption(SortOptions value) {
    Map<SortOptions, int> _map = {
      SortOptions.cardPriceAsc: 0,
      SortOptions.cardPriceDesc: 1,
      SortOptions.paybackDesc: 2,
      SortOptions.paybackAsc: 3,
      SortOptions.dailyUsdDesc: 4,
      SortOptions.dailyUsdAsc: 5,
      SortOptions.none: 6
    };
    return _setInt(_sortOption, _map[value]);
  }

  static Future<bool> getShowPriceRise() async {
    return await _getBool(_showPriceRise) ?? false;
  }

  static Future<bool> setShowPriceRise(bool value) {
    return _setBool(_showPriceRise, value);
  }

  static Future<bool> getIncludeElectricityCost() async {
    return await _getBool(_includeElectricityCost) ?? false;
  }

  static Future<bool> setIncludeElectricityCost(bool value) {
    return _setBool(_includeElectricityCost, value);
  }

  static Future<double> getElectricityCost() async {
    return await _getDouble(_electricityCost) ?? 0;
  }

  static Future<bool> setElectricityCost(double value) {
    return _setDouble(_electricityCost, value);
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
  static const _bynToUsdExchangeSource = "byntousdexchangeource";
  static const _bynToUsdExchangeRate = "byntousdexchangerate";
  static const _sortOption = "sortoption";
  static const _showPriceRise = "showpricerise";
  static const _includeElectricityCost = "includeelectricitycost";
  static const _electricityCost = "electricitycost";
}