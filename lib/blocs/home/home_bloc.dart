import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cryptotool/data/data.dart';
import 'package:cryptotool/injection_component.dart';
import 'package:cryptotool/models/models.dart';
import 'package:cryptotool/utils/utils.dart';
import 'package:dartx/dartx.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DataManager _dataManager;
  
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

    final includeElectricityCost = await PreferencesHelper.getIncludeElectricityCost();
    final electricityCost = await PreferencesHelper.getElectricityCost();

    final initialList = GpuRepository.availableList;

    try {
      final bynToUsdExchangeSource = await PreferencesHelper.getBynToUsdExchangeSource();

      double bynToUsd;
      switch (bynToUsdExchangeSource) {
        case BynToUsdExchangeSource.alfabank:
          final exchangeResponse = await _dataManager.getExchangeRateAlfabank();
          bynToUsd = exchangeResponse.rates?.firstWhereOrNull((item) => item.sellCode == 840 && item.buyCode == 933)?.buyRate ?? 0;
          break;
        case BynToUsdExchangeSource.nbrb:
          final exchangeResponse = await _dataManager.getExchangeRateNbrb();
          bynToUsd = exchangeResponse.officialRate;
          break;
        case BynToUsdExchangeSource.manually:
          bynToUsd = await PreferencesHelper.getBynToUsdExchangeRate();
          break;
      }
      // if (bynToUsd == null) throw('error to get BYN->USD rate');
      final etherchainResponse = await _dataManager.getStat();

      var videocards = <Videocard>[];
      // await initialList.forEach((card) async {
      for (final card in initialList) {
        Videocard? tempCard;
        try {
          final nicehashResponse = await _dataManager.getGpuInfo(card.nicehashId!);
          final daggerHashimoto = nicehashResponse.speeds['DAGGERHASHIMOTO'] ?? 0;
          final isStatActual = nicehashResponse.power != 0 && daggerHashimoto != 0;

          tempCard = card.copy(
            powerUsage: nicehashResponse.power,
            hashRate: daggerHashimoto,
            isStatActual: isStatActual
          );
        // ignore: avoid_catches_without_on_clauses, empty_catches, unused_catch_stack
        } catch (error, stacktrace) {

        }
        
        final response = await _dataManager.getVideocard(card.onlinerGpuName);

        final onlinerCard = response.products.firstOrNull;
        final minPrice = ((onlinerCard?.prices.priceMin.amount.toDoubleOrNull() ?? 0.0) / bynToUsd).roundFixed();
        final maxPrice = ((onlinerCard?.prices.priceMax.amount.toDoubleOrNull() ?? 0.0) / bynToUsd).roundFixed();

        final reward = _reward(
          mhs: card.hashRate,
          blockReward: etherchainResponse.currentStats.blockReward,
          difficulty: etherchainResponse.currentStats.difficulty,
          poolFee: 0
        );

        final revenueDailyInBtc = reward * 24 * etherchainResponse.currentStats.priceBtc;
        final revenueDailyInUsd = reward * 24 * etherchainResponse.currentStats.priceUsd;

        final electricityExp = _electricityExpenses(
          electricityCost: electricityCost,
          powerUsage: card.powerUsage 
        );

        final profitDailyInUsd = revenueDailyInUsd - electricityExp;

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

      final option = event.option;// ?? await PreferencesHelper.getSortOption();

      videocards = filterCards(
        list: videocards,
        option: option,
        includeElectricityCost: includeElectricityCost
      );

      final showPriceRise = await PreferencesHelper.getShowPriceRise();

      _dataManager.gpuFirstLoaded = true;

      yield HomeLoaded(
        bynToUsd: bynToUsd,
        videocards: videocards,
        sortOption: option,
        showPriceRise: showPriceRise,
        includeElectricityCost: includeElectricityCost,
        electricityCost: electricityCost
      );
    // ignore: avoid_catches_without_on_clauses, unused_catch_stack
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
    final hashRate = mhs * 1000000;
    final reward = ((hashRate * blockReward) / difficulty) * (1 - poolFee) * 3600;
    return reward;
  }

  // expenses for 1 day
  double _electricityExpenses({
    required double electricityCost,
    // powerUsage of GPU
    required double powerUsage
  }) => ((powerUsage/1000)*24*electricityCost).roundFixed();

  Stream<HomeState> _mapHomeFilterToState(
    HomeFilter event
  ) async* {
    if (state is HomeLoaded) {
      final tempState = state as HomeLoaded;
      
      final videocards = filterCards(
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
    var videocards = <Videocard>[];

    switch (option) {
      case SortOptions.cardPriceAsc:
        final cardWithZero = list.filter((card) => card.minPrice == 0.0);
        final normalCards = list.filter((card) => card.minPrice != 0.0);

        videocards.addAll(normalCards.sortedBy((card) => card.minPrice));
        videocards.addAll(cardWithZero);
        break;
      case SortOptions.cardPriceDesc:
        videocards = list.sortedByDescending((card) => card.minPrice);
        break;
      case SortOptions.paybackDesc:
        final cardWithZero = list.filter((card) => card.paybackDays(includeElectricityCost) == 0);
        final normalCards = list.filter((card) => card.paybackDays(includeElectricityCost) != 0);

        videocards.addAll(normalCards.sortedBy((card) => card.paybackDays(includeElectricityCost)));
        videocards.addAll(cardWithZero);
        break;
      case SortOptions.paybackAsc:
        final cardWithZero = list.filter((card) => card.paybackDays(includeElectricityCost) == 0);
        final normalCards = list.filter((card) => card.paybackDays(includeElectricityCost) != 0);

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
        final cardWithZero = list.filter((card) => card.priceRise == 0);
        final normalCards = list.filter((card) => card.priceRise != 0);

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
        final tempState = state;
        yield HomeLoading();
        yield tempState;
      }
    }
  }
}
