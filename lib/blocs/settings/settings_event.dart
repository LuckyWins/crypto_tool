part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingsInit extends SettingsEvent {}

class SettingsSave extends SettingsEvent {
  final BynToUsdExchangeSource bynToUsdExchangeSource;
  final double bynToUsdExchangeRate;
  final SortOptions sortOption;
  final bool showPriceRise;
  final bool includeElectricityCost;
  final double electricityCost;
  final double pcPower;

  const SettingsSave({
    @required this.bynToUsdExchangeSource,
    this.bynToUsdExchangeRate,
    @required this.sortOption,
    @required this.showPriceRise,
    @required this.includeElectricityCost,
    @required this.electricityCost,
    @required this.pcPower
  });

  @override
  List<Object> get props => [
    bynToUsdExchangeSource,
    bynToUsdExchangeRate,
    sortOption,
    showPriceRise,
    includeElectricityCost,
    electricityCost,
    pcPower
  ];
}
