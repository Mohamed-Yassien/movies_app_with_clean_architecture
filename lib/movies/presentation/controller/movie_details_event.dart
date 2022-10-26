part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent {}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;

  GetMovieDetailsEvent({
    required this.movieId,
  });
}

class GetMovieRecommendationsEvent extends MovieDetailsEvent {
  final int movieId;

  GetMovieRecommendationsEvent({
    required this.movieId,
  });
}
