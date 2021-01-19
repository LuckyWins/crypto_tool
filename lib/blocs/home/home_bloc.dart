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
    if (event is HomeFilter) {
      yield* _mapHomeFilterToState(event);
    }
  }

  Stream<HomeState> _mapHomeInitToState(
    HomeInit event
  ) async* {
    yield HomeLoading();

    List<Videocard> initialList = GpuRepository.availableList;

    try {
      BynToUsdExchangeSource bynToUsdExchangeSource = await PreferencesHelper.getBynToUsdExchangeSource();

      double bynToUsd;
      switch (bynToUsdExchangeSource) {
        case BynToUsdExchangeSource.alfabank:
          var exchangeResponse = await _dataManager.getExchangeRateAlfabank();
          bynToUsd = exchangeResponse.rates.firstWhere((item) => item.sellCode == 840 && item.buyCode == 933, orElse: () => null)?.buyRate;
          break;
        case BynToUsdExchangeSource.nbrb:
          var exchangeResponse = await _dataManager.getExchangeRateNbrb();
          bynToUsd = exchangeResponse.officialRate;
          break;
        case BynToUsdExchangeSource.manually:
          bynToUsd = await PreferencesHelper.getBynToUsdExchangeRate();
          break;
      }
      if (bynToUsd == null) throw("error to get BYN->USD rate");
      var etherchainResponse = await _dataManager.getStat();

      List<Videocard> videocards = [];
      // await initialList.forEach((card) async {
      for (var card in initialList) {
        var response = await _dataManager.getVideocard(card.onlinerGpuName);

        var onlinerCard = response?.products?.firstOrNull;
        var minPrice = ((onlinerCard?.prices?.priceMin?.amount?.toDoubleOrNull() ?? 0.0) / bynToUsd).roundFixed();
        var maxPrice = ((onlinerCard?.prices?.priceMax?.amount?.toDoubleOrNull() ?? 0.0) / bynToUsd).roundFixed();

        double reward = _reward(
          mhs: card.hashRate,
          blockReward: etherchainResponse.currentStats.blockReward,
          difficulty: etherchainResponse.currentStats.difficulty,
          poolFee: 0.0
        );

        var dailyInBtc = reward * 24 * etherchainResponse.currentStats.priceBtc;
        var dailyInUsd = reward * 24 * etherchainResponse.currentStats.priceUsd;

        videocards.add(card.copy(
          name: onlinerCard?.name ?? "Неизвестно",
          descriprtion: onlinerCard?.microDescription ?? "",
          minPrice: minPrice,
          maxPrice: maxPrice,
          reward: reward,
          dailyInBtc: dailyInBtc,
          dailyInUsd: dailyInUsd,
          pricesUrl: onlinerCard?.prices?.htmlUrl != null
              ? "${onlinerCard?.prices?.htmlUrl}?order=price%3Aasc"
              : null
        ));
      }

      videocards = filterCards(
        list: videocards,
        option: event.option
      );

      yield HomeLoaded(
        bynToUsd: bynToUsd,
        videocards: videocards,
        sortOption: event.option
      );
    } catch (error, stacktrace) {
      yield HomeError(
        error: error
      );
    }
  }

  // get reward for 1h
  double _reward({
    // MH/S
    @required double mhs,
    @required double blockReward,
    @required double difficulty,
    @required double poolFee
  }) {
    double hashRate = mhs * 1000000;
    double reward = ((hashRate * blockReward) / difficulty) * (1 - poolFee) * 3600;
    return reward ?? 0.0;
  }

  Stream<HomeState> _mapHomeFilterToState(
    HomeFilter event
  ) async* {
    if (state is HomeLoaded) {
      var tempState = state as HomeLoaded;
      
      var videocards = filterCards(
        list: tempState.videocards,
        option: event.option
      );

      yield HomeLoaded(
        bynToUsd: tempState.bynToUsd,
        videocards: videocards,
        sortOption: event.option
      );
    }
  }

  List<Videocard> filterCards({
    @required List<Videocard> list,
    @required SortOptions option
  }) {
    List<Videocard> videocards = [];

    switch (option) {
      case SortOptions.cardPriceAsc:
        var cardWithZero = list.filter((card) => card.minPrice == 0.0);
        var normalCards = list.filter((card) => card.minPrice != 0.0);

        videocards.addAll(normalCards.sortedBy((card) => card.minPrice));
        videocards.addAll(cardWithZero);
        break;
      case SortOptions.cardPriceDesc:
        videocards = list.sortedByDescending((card) => card.minPrice);
        break;
      case SortOptions.paybackDesc:
        var cardWithZero = list.filter((card) => card.paybackDays == 0);
        var normalCards = list.filter((card) => card.paybackDays != 0);

        videocards.addAll(normalCards.sortedBy((card) => card.paybackDays));
        videocards.addAll(cardWithZero);
        break;
      case SortOptions.paybackAsc:
        var cardWithZero = list.filter((card) => card.paybackDays == 0);
        var normalCards = list.filter((card) => card.paybackDays != 0);

        videocards.addAll(normalCards.sortedByDescending((card) => card.paybackDays));
        videocards.addAll(cardWithZero);
        break;
      case SortOptions.dailyUsdDesc:
        videocards = list.sortedByDescending((card) => card.dailyInUsd);
        break;
      case SortOptions.dailyUsdAsc:
        videocards = list.sortedBy((card) => card.dailyInUsd);
        break;
      default:
        videocards = list;
        break;
    }
    return videocards;
  }
}
