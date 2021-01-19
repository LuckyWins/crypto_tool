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

  const SettingsInitial({
    @required this.bynToUsdExchangeSource,
    @required this.bynToUsdExchangeRate
  });

  @override
  List<Object> get props => [bynToUsdExchangeSource, bynToUsdExchangeRate];
}

class SettingsSavedSuccess extends SettingsState {}