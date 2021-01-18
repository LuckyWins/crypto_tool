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

  const HomeLoaded({
    @required this.bynToUsd,
    @required this.videocards
  });

  @override
  List<Object> get props => [bynToUsd, videocards];
}

class HomeError extends HomeState {
  final Object error;

  const HomeError({this.error});
}
