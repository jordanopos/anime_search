import 'package:anime_search/src/app/anime/models/anilist.response.model.dart';
import 'package:anime_search/src/app/anime/repository/anime.repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'anime_event.dart';
part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final AnimeRepository _repository;
  AnimeBloc(this._repository) : super(AnimeInitial()) {
    on<AnimeEvent>(
      (event, emit) async {
        if (event is GetFullAnime) {
          try {
            emit(AnimeLoading());
            AnilistResponseModel model =
                await _repository.getFullAnime(event.id);

            emit(AnimeLoaded(model));
          } catch (e) {
            print(e.toString());

            emit(AnimeLoadingError(e.toString()));
          }
        }
      },
    );
  }
}
