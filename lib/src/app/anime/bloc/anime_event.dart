part of 'anime_bloc.dart';

abstract class AnimeEvent extends Equatable {
  const AnimeEvent();

  @override
  List<Object> get props => [];
}

class GetFullAnime extends AnimeEvent {
  final int id;

  const GetFullAnime(this.id);
}
