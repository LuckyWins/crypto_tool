part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();
  
  @override
  List<Object> get props => [];
}

class SettingsLoading extends SettingsState {}

class SettingsInitial extends SettingsState {
  final BynToUsdExchangeSource bynToUsdExchangeSource;
  final double bynToUsdExchangeRate;
  final SortOptions sortOption;
  final bool showPriceRise;
  final bool includeElectricityCost;
  final double electricityCost;

  const SettingsInitial({
    required this.bynToUsdExchangeSource,
    required this.bynToUsdExchangeRate,
    required this.sortOption,
    required this.showPriceRise,
    required this.includeElectricityCost,
    required this.electricityCost,
  });

  @override
  List<Object> get props => [
    bynToUsdExchangeSource,
    bynToUsdExchangeRate,
    sortOption,
    showPriceRise,
    includeElectricityCost,
    electricityCost
  ];
}

class SettingsSavedSuccess extends SettingsState {}