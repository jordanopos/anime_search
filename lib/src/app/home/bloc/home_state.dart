part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final AnimeResponseModel model;

  const HomeLoaded(this.model);
}

class HomeLoadingError extends HomeState {
  final String message;
  const HomeLoadingError(this.message);
}
