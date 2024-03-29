part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeInit extends HomeEvent {
  final SortOptions? option;

  const HomeInit({this.option = SortOptions.none});

  @override
  List<Object?> get props => [option];
}

class HomeFilter extends HomeEvent {
  final SortOptions option;

  const HomeFilter(this.option);

  @override
  List<Object> get props => [option];
}

class HomeCheckLoaded extends HomeEvent {}