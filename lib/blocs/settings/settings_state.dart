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

  const SettingsInitial({
    @required this.bynToUsdExchangeSource,
    @required this.bynToUsdExchangeRate,
    @required this.sortOption
  });

  @override
  List<Object> get props => [bynToUsdExchangeSource, bynToUsdExchangeRate, sortOption];
}

class SettingsSavedSuccess extends SettingsState {}