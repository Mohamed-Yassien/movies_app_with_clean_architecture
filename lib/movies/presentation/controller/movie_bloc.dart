import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_arc/core/utils/enums.dart';
import 'package:movies_clean_arc/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_clean_arc/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_clean_arc/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_clean_arc/movies/presentation/controller/movie_event.dart';
import 'package:movies_clean_arc/movies/presentation/controller/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MovieBloc({
    required this.getNowPlayingMoviesUseCase,
    required this.getTopRatedMoviesUseCase,
    required this.getPopularMoviesUseCase,
  }) : super(const MovieState()) {
    on<GetNowPlayingEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingEvent event, Emitter<MovieState> emit) async {
    final result = await getNowPlayingMoviesUseCase.execute();
    result.fold(
      (l) {
        emit(
          state.copyWith(
            nowPlayingMovieState: RequestState.error,
            nowPlayingErrorMessage: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            nowPlayingMovies: r,
            nowPlayingMovieState: RequestState.loaded,
          ),
        );
      },
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MovieState> emit) async {
    final result = await getPopularMoviesUseCase.execute();
    result.fold(
      (l) {
        emit(state.copyWith(
          popularMovieState: RequestState.error,
          popularErrorMessage: l.message,
        ));
      },
      (r) {
        emit(
          state.copyWith(
            popularMovies: r,
            popularMovieState: RequestState.loaded,
          ),
        );
      },
    );
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MovieState> emit) async {
    final result = await getTopRatedMoviesUseCase.execute();
    result.fold(
      (l) => emit(state.copyWith(
        topRatedErrorMessage: l.message,
        topRatedMovieState: RequestState.error,
      )),
      (r) => emit(
        state.copyWith(
          topRatedMovies: r,
          topRatedMovieState: RequestState.loaded,
        ),
      ),
    );
  }
}
