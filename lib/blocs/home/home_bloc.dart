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

    List<Videocard> initialList = [
      Videocard(gpuName: "NVIDIA RTX 3090", onlinerGpuName: "rtx3090", hashRate: 125.0),
      Videocard(gpuName: "NVIDIA RTX 3080", onlinerGpuName: "rtx3080", hashRate: 100.0),
      // Videocard(gpuName: "AMD VII", onlinerGpuName: "", hashRate: 89.4),
      Videocard(gpuName: "NVIDIA RTX 3060 Ti", onlinerGpuName: "rtx3060ti", hashRate: 60.0),
      Videocard(gpuName: "NVIDIA RTX 3070", onlinerGpuName: "rtx3070", hashRate: 60.0),
      Videocard(gpuName: "AMD RX 5700 XT", onlinerGpuName: "rx5700xt", hashRate: 56.5),
      Videocard(gpuName: "AMD RX 5700", onlinerGpuName: "rx5700", hashRate: 56.0),
      Videocard(gpuName: "NVIDIA RTX 2080 Ti", onlinerGpuName: "rtx2080ti", hashRate: 55.5),
      Videocard(gpuName: "NVIDIA GTX 1080 Ti", onlinerGpuName: "gtx1080ti", hashRate: 46.5),
      Videocard(gpuName: "NVIDIA RTX 2070 SUPER", onlinerGpuName: "rtx2070super", hashRate: 44.3),
      Videocard(gpuName: "NVIDIA RTX 2060 SUPER", onlinerGpuName: "rtx2060super", hashRate: 44.3),
      Videocard(gpuName: "NVIDIA RTX 2070", onlinerGpuName: "rtx2070", hashRate: 44.3),
      Videocard(gpuName: "NVIDIA RTX 2080 SUPER", onlinerGpuName: "rtx2080super", hashRate: 44.3),
      Videocard(gpuName: "NVIDIA RTX 2080", onlinerGpuName: "rtx2080", hashRate: 44.3),
      Videocard(gpuName: "AMD RX 5600 XT", onlinerGpuName: "rx5600xt", hashRate: 42.2),
      // Videocard(gpuName: "AMD RX Vega 64", onlinerGpuName: "", hashRate: 40.0),
      // Videocard(gpuName: "NVIDIA P104-100", onlinerGpuName: "", hashRate: 37.0),
      Videocard(gpuName: "AMD RX Vega 56", onlinerGpuName: "rxvega56", hashRate: 36.5),
      Videocard(gpuName: "NVIDIA GTX 1080", onlinerGpuName: "gtx1080", hashRate: 35.5),
      Videocard(gpuName: "AMD RX 580 8GB", onlinerGpuName: "radeonrx580", hashRate: 32.2),
      Videocard(gpuName: "AMD RX 480 8GB", onlinerGpuName: "radeonrx480", hashRate: 31.5),
      Videocard(gpuName: "AMD RX 570 8GB", onlinerGpuName: "radeonrx570", hashRate: 30.9),
      Videocard(gpuName: "NVIDIA GTX 1660 SUPER", onlinerGpuName: "gtx1660super", hashRate: 30.2),
      Videocard(gpuName: "NVIDIA GTX 1070 Ti", onlinerGpuName: "gtx1070ti", hashRate: 30.0),
      // Videocard(gpuName: "AMD RX 470 8GB", onlinerGpuName: "x470", hashRate: 29.7),
      Videocard(gpuName: "NVIDIA GTX 1660 Ti", onlinerGpuName: "gtx1660ti", hashRate: 29.1),
      Videocard(gpuName: "NVIDIA RTX 2060", onlinerGpuName: "rtx2060", hashRate: 28.6),
      Videocard(gpuName: "NVIDIA GTX 1070", onlinerGpuName: "gtx1070", hashRate: 28.2),
      Videocard(gpuName: "AMD RX 5500 XT 8GB", onlinerGpuName: "rx5500xt", hashRate: 26.5),
      Videocard(gpuName: "NVIDIA GTX 1660", onlinerGpuName: "gtx1660", hashRate: 24.5),
      Videocard(gpuName: "NVIDIA GTX 1060 6GB", onlinerGpuName: "gfgtx1060", hashRate: 22.5),
      // Videocard(gpuName: "NVIDIA P106-100", onlinerGpuName: "", hashRate: 22.5),
      // Videocard(gpuName: "NVIDIA P106-90", onlinerGpuName: "", hashRate: 13.4)
    ];

    // try {
      var exchangeResponse = await _dataManager.getExchangeRate();
      double bynToUsd = exchangeResponse.officialRate;
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
          pricesUrl: onlinerCard?.prices?.htmlUrl
        ));
      };

      yield HomeLoaded(
        bynToUsd: bynToUsd,
        videocards: videocards,
        sortOption: SortOptions.none
      );
    // } catch (error, stacktrace) {
    //   yield HomeError(
    //     error: error
    //   );
    // }
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
      // var videocards = tempState.videocards.sortedBy((element) => null);
      List<Videocard> videocards = [];
      switch (event.option) {
        case SortOptions.cardPriceAsc:
          videocards = tempState.videocards.sortedBy((card) => card.minPrice);
          break;
        case SortOptions.cardPriceDesc:
          videocards = tempState.videocards.sortedByDescending((card) => card.minPrice);
          break;
        case SortOptions.paybackDesc:
          var cardWithZero = tempState.videocards.filter((card) => card.paybackDays == 0);
          var normalCards = tempState.videocards.filter((card) => card.paybackDays != 0);

          videocards.addAll(normalCards.sortedBy((card) => card.paybackDays));
          videocards.addAll(cardWithZero);
          break;
        case SortOptions.paybackAsc:
          var cardWithZero = tempState.videocards.filter((card) => card.paybackDays == 0);
          var normalCards = tempState.videocards.filter((card) => card.paybackDays != 0);

          videocards.addAll(normalCards.sortedByDescending((card) => card.paybackDays));
          videocards.addAll(cardWithZero);
          break;
        case SortOptions.dailyUsdDesc:
          videocards = tempState.videocards.sortedByDescending((card) => card.dailyInUsd);
          break;
        case SortOptions.dailyUsdAsc:
          videocards = tempState.videocards.sortedBy((card) => card.dailyInUsd);
          break;
        default:
          videocards = tempState.videocards;
          break;
      }

      yield HomeLoaded(
        bynToUsd: tempState.bynToUsd,
        videocards: videocards,
        sortOption: event.option
      );
    }
  }
}
