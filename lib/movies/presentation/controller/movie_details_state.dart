part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;

  final List<MovieRecommendation> movieRecommendations;
  final RequestState movieRecommendationState;
  final String movieRecommendationMessage;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsMessage = '',
    this.movieDetailsState = RequestState.loading,
    this.movieRecommendations = const [],
    this.movieRecommendationMessage = '',
    this.movieRecommendationState = RequestState.loading,
  });

  MovieDetailsState copyWith({
    MovieDetail? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<MovieRecommendation>? movieRecommendations,
    RequestState? movieRecommendationState,
    String? movieRecommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieRecommendations: movieRecommendations ?? this.movieRecommendations,
      movieRecommendationMessage:
          movieRecommendationMessage ?? this.movieRecommendationMessage,
      movieRecommendationState:
          movieRecommendationState ?? this.movieRecommendationState,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        movieRecommendations,
        movieRecommendationState,
        movieRecommendationMessage,
      ];
}
