import 'package:equatable/equatable.dart';
import 'package:movies_clean_arc/core/utils/enums.dart';

import '../../domain/entities/movie.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final MovieStateEnum nowPlayingMovieState;
  final String nowPlayingErrorMessage;

  const MovieState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMovieState = MovieStateEnum.loading,
    this.nowPlayingErrorMessage = '',
  });

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingMovieState,
        nowPlayingErrorMessage,
      ];
}
