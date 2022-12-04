part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SearchAnime extends HomeEvent {
  final XFile file;

  const SearchAnime(this.file);
}
