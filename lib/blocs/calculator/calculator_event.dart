part of 'calculator_bloc.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

class CalculatorInit extends CalculatorEvent {}

class CalculatorCompute extends CalculatorEvent {
  final double hashrate;

  const CalculatorCompute(this.hashrate);

  @override
  List<Object> get props => [hashrate];
}

class CalculatorUpdateTime extends CalculatorEvent {
  final CalculateTime time;

  const CalculatorUpdateTime(this.time);

  @override
  List<Object> get props => [time];
}