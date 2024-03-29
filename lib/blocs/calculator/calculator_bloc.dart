import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cryptotool/data/data.dart';
import 'package:cryptotool/injection_component.dart';
import 'package:cryptotool/models/models.dart';
import 'package:dartx/dartx.dart';
import 'package:equatable/equatable.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final DataManager _dataManager;

  CalculatorBloc() : _dataManager = InjectionComponent.getDependency<DataManager>(),
  super(CalculatorLoading());

  double ethRate = 1;
  double changePercentage = 0;
  double ethDailyProfit = 1;
  int hashrate = 1;
  CalculateTime time = CalculateTime.day;

  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {
    if (event is CalculatorInit) {
      yield* _mapCalculatorInitToState(event);
    }
    if (event is CalculatorCompute) {
      yield* _mapCalculatorComputeToState(event);
    }
    if (event is CalculatorUpdateTime) {
      yield* _mapCalculatorUpdateTimeToState(event);
    }
    if (event is CalculatorCheckLoaded) {
      yield* _mapCalculatorCheckLoadedToState(event);
    }
  }

  Stream<CalculatorState> _mapCalculatorInitToState(
    CalculatorInit event
  ) async* {
    yield CalculatorLoading();

    try {
      final rateResponse = await _dataManager.getEmcdStats();

      // ethRate = 1743.9;
      ethRate = rateResponse.marketPriceUsd;
      changePercentage = rateResponse.changePercentage;

      final response = await _dataManager.getEmcdCalc();
      // ethDailyProfit = 77.08864736 / 1000000;
      ethDailyProfit = response.coins.eth / 1000000;

      final calc = _calculate();

      _dataManager.calculatorFirstLoaded = true;

      yield CalculatorInitial(
        ethRate: ethRate,
        changePercentage: changePercentage,
        ethProfit: calc.ethProfit,
        usdProfit: calc.usdProfit,
        time: time,
        hashrate: hashrate
      );
    // ignore: avoid_catches_without_on_clauses, unused_catch_stack
    } catch (error, stacktrace) {
      yield CalculatorError(
        error: error
      );
    }
  }

  Stream<CalculatorState> _mapCalculatorComputeToState(
    CalculatorCompute event
  ) async* {
    yield CalculatorLoading();

    hashrate = event.hashrate;
    final calc = _calculate();

    yield CalculatorInitial(
      ethRate: ethRate,
      changePercentage: changePercentage,
      ethProfit: calc.ethProfit,
      usdProfit: calc.usdProfit,
      time: time,
      hashrate: hashrate
    );
  }

  Stream<CalculatorState> _mapCalculatorUpdateTimeToState(
    CalculatorUpdateTime event
  ) async* {
    if (state is CalculatorInitial) {
      yield CalculatorLoading();

      time = event.time;
      final calc = _calculate();

      yield CalculatorInitial(
        ethRate: ethRate,
        changePercentage: changePercentage,
        ethProfit: calc.ethProfit,
        usdProfit: calc.usdProfit,
        time: time,
        hashrate: hashrate
      );
    }
  }

  CalculateResult _calculate() {
    final ethProfit = ethDailyProfit * hashrate * time.calculationTactic;
    final usdProfit = (ethProfit * ethRate).toStringAsFixed(2).toDouble();

    return CalculateResult(
      ethProfit: ethProfit.toStringAsFixed(8).toDouble(),
      usdProfit: usdProfit
    );
  }

  Stream<CalculatorState> _mapCalculatorCheckLoadedToState(
    CalculatorCheckLoaded event
  ) async* {
    if (!_dataManager.calculatorFirstLoaded) {
      yield CalculatorToggleRefresh();
    }
  }
}
