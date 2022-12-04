part of 'anime_bloc.dart';

abstract class AnimeState extends Equatable {
  const AnimeState();

  @override
  List<Object> get props => [];
}

class AnimeInitial extends AnimeState {}

class AnimeLoading extends AnimeState {}

class AnimeLoaded extends AnimeState {
  final AnilistResponseModel model;

  const AnimeLoaded(this.model);
}

class AnimeLoadingError extends AnimeState {
  final String message;

  const AnimeLoadingError(this.message);
}
