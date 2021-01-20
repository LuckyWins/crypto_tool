import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cryptotool/data/data.dart';
import 'package:cryptotool/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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

    var bynToUsdExchangeSource = await PreferencesHelper.getBynToUsdExchangeSource();
    var bynToUsdExchangeRate = await PreferencesHelper.getBynToUsdExchangeRate();
    var sortOption = await PreferencesHelper.getSortOption();
    var showPriceRise = await PreferencesHelper.getShowPriceRise();
    var includeElectricityCost = await PreferencesHelper.getIncludeElectricityCost();
    var electricityCost = await PreferencesHelper.getElectricityCost();
    var pcPower = await PreferencesHelper.getPcPower();

    yield SettingsInitial(
      bynToUsdExchangeSource: bynToUsdExchangeSource,
      bynToUsdExchangeRate: bynToUsdExchangeRate,
      sortOption: sortOption,
      showPriceRise: showPriceRise,
      includeElectricityCost: includeElectricityCost,
      electricityCost: electricityCost,
      pcPower: pcPower
    );
  }

  Stream<SettingsState> _mapSettingsSaveToState(
    SettingsSave event
  ) async* {
    await PreferencesHelper.setBynToUsdExchangeSource(event.bynToUsdExchangeSource);
    if (event.bynToUsdExchangeSource == BynToUsdExchangeSource.manually) {
      await PreferencesHelper.setBynToUsdExchangeRate(event.bynToUsdExchangeRate);
    }

    await PreferencesHelper.setSortOption(event.sortOption);
    await PreferencesHelper.setShowPriceRise(event.showPriceRise);
    await PreferencesHelper.setIncludeElectricityCost(event.includeElectricityCost);
    await PreferencesHelper.setElectricityCost(event.electricityCost);
    await PreferencesHelper.setPcPower(event.pcPower);

    yield SettingsSavedSuccess();
  }
}
