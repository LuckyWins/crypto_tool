part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final double bynToUsd;
  final List<Videocard> videocards;
  final SortOptions sortOption;
  final bool showPriceRise;
  final bool includeElectricityCost;
  final double electricityCost;

  const HomeLoaded({
    @required this.bynToUsd,
    @required this.videocards,
    @required this.sortOption,
    @required this.showPriceRise,
    @required this.includeElectricityCost,
    @required this.electricityCost
  });

  @override
  List<Object> get props => [
    bynToUsd,
    videocards,
    sortOption,
    showPriceRise,
    includeElectricityCost,
    electricityCost
  ];
}

class HomeError extends HomeState {
  final Object error;

  const HomeError({this.error});
}
