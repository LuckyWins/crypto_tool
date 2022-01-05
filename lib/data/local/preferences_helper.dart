import 'package:cryptotool/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: avoid_classes_with_only_static_members
class PreferencesHelper {

  static Future<BynToUsdExchangeSource> getBynToUsdExchangeSource() async {
    final _map = <int, BynToUsdExchangeSource>{
      0: BynToUsdExchangeSource.alfabank,
      1: BynToUsdExchangeSource.nbrb,
      2: BynToUsdExchangeSource.manually
    };
    final value = await _getInt(_bynToUsdExchangeSource);
    return _map[value] ?? BynToUsdExchangeSource.manually;
  }

  static Future<bool> setBynToUsdExchangeSource(BynToUsdExchangeSource value) {
    final _map = <BynToUsdExchangeSource, int>{
      BynToUsdExchangeSource.alfabank: 0,
      BynToUsdExchangeSource.nbrb: 1,
      BynToUsdExchangeSource.manually: 2
    };
    return _setInt(_bynToUsdExchangeSource, _map[value]!);
  }

  static Future<double> getBynToUsdExchangeRate() async => await _getDouble(_bynToUsdExchangeRate) ?? 1;

  static Future<bool> setBynToUsdExchangeRate(double value) => _setDouble(_bynToUsdExchangeRate, value);

  static Future<SortOptions> getSortOption() async {
    final _map = <int, SortOptions>{
      0: SortOptions.cardPriceAsc,
      1: SortOptions.cardPriceDesc,
      2: SortOptions.paybackDesc,
      3: SortOptions.paybackAsc,
      4: SortOptions.dailyUsdDesc,
      5: SortOptions.dailyUsdAsc,
      6: SortOptions.none
    };
    final value = await _getInt(_sortOption);
    return _map[value] ?? SortOptions.none;
  }

  static Future<bool> setSortOption(SortOptions value) {
    final _map = <SortOptions, int>{
      SortOptions.cardPriceAsc: 0,
      SortOptions.cardPriceDesc: 1,
      SortOptions.paybackDesc: 2,
      SortOptions.paybackAsc: 3,
      SortOptions.dailyUsdDesc: 4,
      SortOptions.dailyUsdAsc: 5,
      SortOptions.none: 6
    };
    return _setInt(_sortOption, _map[value]!);
  }

  static Future<bool> getShowPriceRise() async => await _getBool(_showPriceRise) ?? false;

  // ignore: avoid_positional_boolean_parameters
  static Future<bool> setShowPriceRise(bool value) => _setBool(_showPriceRise, value);

  static Future<bool> getIncludeElectricityCost() async => await _getBool(_includeElectricityCost) ?? false;

  // ignore: avoid_positional_boolean_parameters
  static Future<bool> setIncludeElectricityCost(bool value) => _setBool(_includeElectricityCost, value);

  static Future<double> getElectricityCost() async => await _getDouble(_electricityCost) ?? 0.0;

  static Future<bool> setElectricityCost(double value) => _setDouble(_electricityCost, value);

  /// get/set for different types
  
  static Future<int?> _getInt(String key) async {
    final prefs = await _load();
    return prefs.getInt(key);
  }

  static Future<bool> _setInt(String key, int value) async {
    final prefs = await _load();
    return prefs.setInt(key, value);
  }

  static Future<double?> _getDouble(String key) async {
    final prefs = await _load();
    return prefs.getDouble(key);
  }

  static Future<bool> _setDouble(String key, double value) async {
    final prefs = await _load();
    return prefs.setDouble(key, value);
  }

  static Future<bool?> _getBool(String key) async {
    final prefs = await _load();
    return prefs.getBool(key);
  }

  static Future<bool> _setBool(String key, bool value) async {
    final prefs = await _load();
    return prefs.setBool(key, value);
  }

  static Future<SharedPreferences> _load() async => await SharedPreferences.getInstance();

  //keys
  static const _bynToUsdExchangeSource = 'byntousdexchangeource';
  static const _bynToUsdExchangeRate = 'byntousdexchangerate';
  static const _sortOption = 'sortoption';
  static const _showPriceRise = 'showpricerise';
  static const _includeElectricityCost = 'includeelectricitycost';
  static const _electricityCost = 'electricitycost';
}