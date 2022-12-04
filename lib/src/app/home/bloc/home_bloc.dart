import 'package:anime_search/src/app/home/models/anime.response.model.dart';
import 'package:anime_search/src/app/home/repository/home.repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  Logger _logger = Logger();

  HomeBloc(this.homeRepository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is SearchAnime) {
        try {
          emit(HomeLoading());
          AnimeResponseModel model =
              await homeRepository.searchAnime(event.file);
          emit(HomeLoaded(model));
        } catch (e) {
          _logger.e(e.toString());
          emit(HomeLoadingError("Something went wrong"));
        }
      }
    });
  }
}

