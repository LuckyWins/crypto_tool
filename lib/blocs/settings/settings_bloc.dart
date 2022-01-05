import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cryptotool/data/data.dart';
import 'package:cryptotool/models/models.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsLoading());

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is SettingsInit) {
      yield* _mapSettingsInitToState(event);
    }
    if (event is SettingsSave) {
      yield* _mapSettingsSaveToState(event);
    }
  }

  Stream<SettingsState> _mapSettingsInitToState(
    SettingsInit event
  ) async* {
    yield SettingsLoading();

    final bynToUsdExchangeSource = await PreferencesHelper.getBynToUsdExchangeSource();
    final bynToUsdExchangeRate = await PreferencesHelper.getBynToUsdExchangeRate();
    final sortOption = await PreferencesHelper.getSortOption();
    final showPriceRise = await PreferencesHelper.getShowPriceRise();
    final includeElectricityCost = await PreferencesHelper.getIncludeElectricityCost();
    final electricityCost = await PreferencesHelper.getElectricityCost();

    yield SettingsInitial(
      bynToUsdExchangeSource: bynToUsdExchangeSource,
      bynToUsdExchangeRate: bynToUsdExchangeRate,
      sortOption: sortOption,
      showPriceRise: showPriceRise,
      includeElectricityCost: includeElectricityCost,
      electricityCost: electricityCost,
    );
  }

  Stream<SettingsState> _mapSettingsSaveToState(
    SettingsSave event
  ) async* {
    await PreferencesHelper.setBynToUsdExchangeSource(event.bynToUsdExchangeSource);
    if (event.bynToUsdExchangeSource == BynToUsdExchangeSource.manually) {
      await PreferencesHelper.setBynToUsdExchangeRate(event.bynToUsdExchangeRate!);
    }

    await PreferencesHelper.setSortOption(event.sortOption);
    await PreferencesHelper.setShowPriceRise(event.showPriceRise);
    await PreferencesHelper.setIncludeElectricityCost(event.includeElectricityCost);
    if (event.electricityCost != null) {
      await PreferencesHelper.setElectricityCost(event.electricityCost!);
    }

    yield SettingsSavedSuccess();
  }
}
