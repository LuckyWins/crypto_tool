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

  const SettingsSave({
    @required this.bynToUsdExchangeSource,
    this.bynToUsdExchangeRate,
    @required this.sortOption
  });

  @override
  List<Object> get props => [bynToUsdExchangeSource, bynToUsdExchangeRate, sortOption];
}
