import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_arc/core/utils/enums.dart';
import 'package:movies_clean_arc/movies/domain/entities/movie_detail.dart';
import 'package:movies_clean_arc/movies/domain/entities/movie_recommendation.dart';
import 'package:movies_clean_arc/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_clean_arc/movies/domain/usecases/get_movie_recommendation_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecommendationUseCase getMovieRecommendationUseCase;

  MovieDetailsBloc({
    required this.getMovieDetailsUseCase,
    required this.getMovieRecommendationUseCase,
  }) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationsEvent>(_getMovieRecommendations);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase.call(
      MovieDetailsParameters(id: event.movieId),
    );
    print(result);
    result.fold(
      (l) => emit(state.copyWith(
        movieDetailsState: RequestState.error,
        movieDetailsMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          movieDetailsState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getMovieRecommendations(GetMovieRecommendationsEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getMovieRecommendationUseCase
        .call(MovieRecommendationParameters(id: event.movieId));
    result.fold(
      (l) => emit(state.copyWith(
        movieRecommendationState: RequestState.error,
        movieRecommendationMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          movieRecommendations: r,
          movieRecommendationState: RequestState.loaded,
        ),
      ),
    );
  }
}
