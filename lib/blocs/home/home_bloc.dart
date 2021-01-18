import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cryptotool/data/data.dart';
import 'package:cryptotool/injection_component.dart';
import 'package:cryptotool/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:dartx/dartx.dart';
import 'package:cryptotool/utils/utils.dart';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  DataManager _dataManager;
  
  HomeBloc() : super(HomeLoading()) {
    _dataManager = InjectionComponent.getDependency<DataManager>();
  }

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeInit) {
      yield* _mapHomeInitToState(event);
    }
  }

  Stream<HomeState> _mapHomeInitToState(
    HomeInit event
  ) async* {
    yield HomeLoading();

    try {
      var exchangeResponse = await _dataManager.getExchangeRate();
      double bynToUsd = exchangeResponse.officialRate;
      if (bynToUsd == null) throw("error to get BYN->USD rate");
      var response = await _dataManager.getVideocard("rtx2070");

      List<Videocard> videocards = [];

      var onlinerCard = response.products.first;
      var minPrice = ((onlinerCard.prices.priceMin.amount.toDoubleOrNull() ?? 0.0) / bynToUsd).roundFixed();
      var maxPrice = ((onlinerCard.prices.priceMax.amount.toDoubleOrNull() ?? 0.0) / bynToUsd).roundFixed();

      videocards.add(Videocard(
        name: onlinerCard.name ?? "Неизвестно",
        descriprtion: onlinerCard.microDescription,
        minPrice: minPrice,
        maxPrice: maxPrice,
      ));

      yield HomeLoaded(
        bynToUsd: bynToUsd,
        videocards: videocards
      );
    } catch (error, stacktrace) {
      yield HomeError(
        error: error
      );
    }
  }
}
