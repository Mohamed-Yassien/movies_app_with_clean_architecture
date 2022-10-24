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

  const MovieState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMovieState = RequestState.loading,
    this.nowPlayingErrorMessage = '',
    this.popularMovies = const [],
    this.popularErrorMessage = '',
    this.popularMovieState = RequestState.loading,
  });

  MovieState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingMovieState,
    String? nowPlayingErrorMessage,
    List<Movie>? popularMovies,
    RequestState? popularMovieState,
    String? popularErrorMessage,
  }) {
    return MovieState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMovieState: nowPlayingMovieState ?? this.nowPlayingMovieState,
      nowPlayingErrorMessage:
          nowPlayingErrorMessage ?? this.nowPlayingErrorMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMovieState: popularMovieState ?? this.popularMovieState,
      popularErrorMessage: popularErrorMessage ?? this.popularErrorMessage,
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
      ];
}
