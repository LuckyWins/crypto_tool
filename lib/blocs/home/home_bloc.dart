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
  
  HomeBloc() : _dataManager = InjectionComponent.getDependency<DataManager>(),
  super(HomeLoading());

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
    if (event is HomeCheckLoaded) {
      yield* _mapHomeCheckLoadedToState(event);
    }
  }

  Stream<HomeState> _mapHomeInitToState(
    HomeInit event
  ) async* {
    yield HomeLoading();

    var includeElectricityCost = await PreferencesHelper.getIncludeElectricityCost();
    var electricityCost = await PreferencesHelper.getElectricityCost();

    List<Videocard> initialList = GpuRepository.availableList;

    try {
      BynToUsdExchangeSource bynToUsdExchangeSource = await PreferencesHelper.getBynToUsdExchangeSource();

      double bynToUsd;
      switch (bynToUsdExchangeSource) {
        case BynToUsdExchangeSource.alfabank:
          var exchangeResponse = await _dataManager.getExchangeRateAlfabank();
          bynToUsd = exchangeResponse.rates?.firstWhereOrNull((item) => item.sellCode == 840 && item.buyCode == 933)?.buyRate ?? 0;
          break;
        case BynToUsdExchangeSource.nbrb:
          var exchangeResponse = await _dataManager.getExchangeRateNbrb();
          bynToUsd = exchangeResponse.officialRate;
          break;
        case BynToUsdExchangeSource.manually:
          bynToUsd = await PreferencesHelper.getBynToUsdExchangeRate();
          break;
      }
      if (bynToUsd == null) throw('error to get BYN->USD rate');
      var etherchainResponse = await _dataManager.getStat();

      List<Videocard> videocards = [];
      // await initialList.forEach((card) async {
      for (var card in initialList) {
        Videocard? tempCard;
        try {
          var nicehashResponse = await _dataManager.getGpuInfo(card.nicehashId!);
          double daggerHashimoto = nicehashResponse.speeds["DAGGERHASHIMOTO"] ?? 0;
          bool isStatActual = nicehashResponse.power != 0 && daggerHashimoto != 0;

          tempCard = card.copy(
            powerUsage: nicehashResponse.power,
            hashRate: daggerHashimoto,
            isStatActual: isStatActual
          );
        } catch (error, stacktrace) {}
        
        var response = await _dataManager.getVideocard(card.onlinerGpuName);

        var onlinerCard = response.products.firstOrNull;
        var minPrice = ((onlinerCard?.prices.priceMin.amount.toDoubleOrNull() ?? 0.0) / bynToUsd).roundFixed();
        var maxPrice = ((onlinerCard?.prices.priceMax.amount.toDoubleOrNull() ?? 0.0) / bynToUsd).roundFixed();

        double reward = _reward(
          mhs: card.hashRate,
          blockReward: etherchainResponse.currentStats.blockReward,
          difficulty: etherchainResponse.currentStats.difficulty,
          poolFee: 0.0
        );

        var revenueDailyInBtc = reward * 24 * etherchainResponse.currentStats.priceBtc;
        var revenueDailyInUsd = reward * 24 * etherchainResponse.currentStats.priceUsd;

        var electricityExp = _electricityExpenses(
          electricityCost: electricityCost,
          powerUsage: card.powerUsage 
        );

        var profitDailyInUsd = revenueDailyInUsd - electricityExp;

        tempCard = (tempCard ?? card).copy(
          name: onlinerCard?.name ?? 'Неизвестно',
          descriprtion: onlinerCard?.microDescription ?? '',
          minPrice: minPrice,
          maxPrice: maxPrice,
          reward: reward,
          revenueDailyInBtc: revenueDailyInBtc,
          revenueDailyInUsd: revenueDailyInUsd,
          profitDailyInUsd: profitDailyInUsd,
          electricityExpensesDaily: electricityExp,
          pricesUrl: onlinerCard?.prices.htmlUrl != null
              ? '${onlinerCard?.prices.htmlUrl}?order=price%3Aasc'
              : null
        );

        videocards.add(tempCard);
      }

      var option = event.option;// ?? await PreferencesHelper.getSortOption();

      videocards = filterCards(
        list: videocards,
        option: option,
        includeElectricityCost: includeElectricityCost
      );

      var showPriceRise = await PreferencesHelper.getShowPriceRise();

      _dataManager.gpuFirstLoaded = true;

      yield HomeLoaded(
        bynToUsd: bynToUsd,
        videocards: videocards,
        sortOption: option,
        showPriceRise: showPriceRise,
        includeElectricityCost: includeElectricityCost,
        electricityCost: electricityCost
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
    required double mhs,
    required double blockReward,
    required double difficulty,
    required double poolFee
  }) {
    double hashRate = mhs * 1000000;
    double reward = ((hashRate * blockReward) / difficulty) * (1 - poolFee) * 3600;
    return reward;
  }

  // expenses for 1 day
  double _electricityExpenses({
    required double electricityCost,
    // powerUsage of GPU
    required double powerUsage
  }) {
    return ((powerUsage/1000)*24*electricityCost).roundFixed();
  }

  Stream<HomeState> _mapHomeFilterToState(
    HomeFilter event
  ) async* {
    if (state is HomeLoaded) {
      var tempState = state as HomeLoaded;
      
      var videocards = filterCards(
        list: tempState.videocards,
        option: event.option,
        includeElectricityCost: tempState.includeElectricityCost
      );

      yield HomeLoaded(
        bynToUsd: tempState.bynToUsd,
        videocards: videocards,
        sortOption: event.option,
        showPriceRise: tempState.showPriceRise,
        includeElectricityCost: tempState.includeElectricityCost,
        electricityCost: tempState.electricityCost
      );
    }
  }

  List<Videocard> filterCards({
    required List<Videocard> list,
    required SortOptions option,
    required bool includeElectricityCost
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
        var cardWithZero = list.filter((card) => card.paybackDays(includeElectricityCost) == 0);
        var normalCards = list.filter((card) => card.paybackDays(includeElectricityCost) != 0);

        videocards.addAll(normalCards.sortedBy((card) => card.paybackDays(includeElectricityCost)));
        videocards.addAll(cardWithZero);
        break;
      case SortOptions.paybackAsc:
        var cardWithZero = list.filter((card) => card.paybackDays(includeElectricityCost) == 0);
        var normalCards = list.filter((card) => card.paybackDays(includeElectricityCost) != 0);

        videocards.addAll(normalCards.sortedByDescending((card) => card.paybackDays(includeElectricityCost)));
        videocards.addAll(cardWithZero);
        break;
      case SortOptions.dailyUsdDesc:
        videocards = list.sortedByDescending((card) => card.revenueDailyInUsd);
        break;
      case SortOptions.dailyUsdAsc:
        videocards = list.sortedBy((card) => card.revenueDailyInUsd);
        break;
      case SortOptions.priceRiseAsc:
        var cardWithZero = list.filter((card) => card.priceRise == 0);
        var normalCards = list.filter((card) => card.priceRise != 0);

        videocards.addAll(normalCards.sortedBy((card) => card.priceRise));
        videocards.addAll(cardWithZero);
        break;
      default:
        videocards = list;
        break;
    }
    return videocards;
  }

  Stream<HomeState> _mapHomeCheckLoadedToState(
    HomeCheckLoaded event
  ) async* {
    if (!_dataManager.gpuFirstLoaded) {
      yield HomeToggleRefresh();
    } else {
      if (state is HomeLoaded) {
        var tempState = state;
        yield HomeLoading();
        yield tempState;
      }
    }
  }
}
