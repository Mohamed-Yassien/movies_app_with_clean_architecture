import 'package:equatable/equatable.dart';
import 'package:movies_clean_arc/core/utils/enums.dart';

import '../../domain/entities/movie.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingMovieState;
  final String nowPlayingErrorMessage;
  final List<Movie> popularMovies;
  final RequestState popularMovieState;
  final String popularErrorMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedMovieState;
  final String topRatedErrorMessage;

  const MovieState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMovieState = RequestState.loading,
    this.nowPlayingErrorMessage = '',
    this.popularMovies = const [],
    this.popularErrorMessage = '',
    this.popularMovieState = RequestState.loading,
    this.topRatedMovies = const [],
    this.topRatedErrorMessage = '',
    this.topRatedMovieState = RequestState.loading,
  });

  MovieState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingMovieState,
    String? nowPlayingErrorMessage,
    List<Movie>? popularMovies,
    RequestState? popularMovieState,
    String? popularErrorMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedMovieState,
    String? topRatedErrorMessage,
  }) {
    return MovieState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMovieState: nowPlayingMovieState ?? this.nowPlayingMovieState,
      nowPlayingErrorMessage:
          nowPlayingErrorMessage ?? this.nowPlayingErrorMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMovieState: popularMovieState ?? this.popularMovieState,
      popularErrorMessage: popularErrorMessage ?? this.popularErrorMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMovieState: topRatedMovieState ?? this.topRatedMovieState,
      topRatedErrorMessage: topRatedErrorMessage ?? this.topRatedErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingMovieState,
        nowPlayingErrorMessage,
        popularMovies,
        popularMovieState,
        popularErrorMessage,
        topRatedMovies,
        topRatedMovieState,
        topRatedErrorMessage,
      ];
}
