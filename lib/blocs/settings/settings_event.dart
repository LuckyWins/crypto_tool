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

  const SettingsSave({
    @required this.bynToUsdExchangeSource,
    this.bynToUsdExchangeRate
  });

  @override
  List<Object> get props => [bynToUsdExchangeSource, bynToUsdExchangeRate];
}
