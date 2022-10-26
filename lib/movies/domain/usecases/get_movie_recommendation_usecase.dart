import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_clean_arc/core/error/failure.dart';
import 'package:movies_clean_arc/core/use_case/base_usecase.dart';
import 'package:movies_clean_arc/movies/domain/entities/movie_recommendation.dart';
import 'package:movies_clean_arc/movies/domain/repository/base_movies_repository.dart';

class GetMovieRecommendationUseCase extends BaseUseCase<
    List<MovieRecommendation>, MovieRecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieRecommendationUseCase({required this.baseMoviesRepository});

  @override
  Future<Either<Failure, List<MovieRecommendation>>> call(
      MovieRecommendationParameters parameter) async {
    return await baseMoviesRepository.getMovieRecommendation(
        parameter: parameter);
  }
}

class MovieRecommendationParameters extends Equatable {
  final int id;

  const MovieRecommendationParameters({required this.id});

  @override
  List<Object> get props => [id];
}
