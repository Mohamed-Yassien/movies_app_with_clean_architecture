import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_arc/core/utils/enums.dart';
import 'package:movies_clean_arc/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_clean_arc/movies/data/repository/movie_repository.dart';
import 'package:movies_clean_arc/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_clean_arc/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_clean_arc/movies/presentation/controller/movie_event.dart';
import 'package:movies_clean_arc/movies/presentation/controller/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {

  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  MovieBloc({required this.getNowPlayingMoviesUseCase}) : super(const MovieState()) {
    on<GetNowPlayingEvent>((event, emit) async {
      final result =
          await getNowPlayingMoviesUseCase.execute();
      emit(const MovieState(nowPlayingMovieState: RequestState.loaded));
      result.fold(
        (l) {
          emit(
            MovieState(
              nowPlayingMovieState: RequestState.error,
              nowPlayingErrorMessage: l.message,
            ),
          );
        },
        (r) {
          emit(
            MovieState(
              nowPlayingMovies: r,
              nowPlayingMovieState: RequestState.loaded,
            ),
          );
        },
      );
    });
  }
}
