part of 'calculator_bloc.dart';

abstract class CalculatorState extends Equatable {
  const CalculatorState();
  
  @override
  List<Object> get props => [];
}

class CalculatorInitial extends CalculatorState {
  final double ethRate;
  final double changePercentage;
  final double ethProfit;
  final double usdProfit;
  final CalculateTime time;

  const CalculatorInitial({
    @required this.ethRate,
    @required this.changePercentage,
    @required this.ethProfit,
    @required this.usdProfit,
    @required this.time
  });

  @override
  List<Object> get props => [ethRate, changePercentage, ethProfit, usdProfit, time];
}

class CalculatorLoading extends CalculatorState {}

class CalculatorError extends CalculatorState {
  final Object error;

  const CalculatorError({this.error});
}