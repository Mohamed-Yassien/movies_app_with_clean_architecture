import 'package:dartz/dartz.dart';
import 'package:movies_clean_arc/core/error/failure.dart';
import 'package:movies_clean_arc/movies/domain/entities/movie.dart';
import 'package:movies_clean_arc/movies/domain/entities/movie_detail.dart';
import 'package:movies_clean_arc/movies/domain/entities/movie_recommendation.dart';
import 'package:movies_clean_arc/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_clean_arc/movies/domain/usecases/get_movie_recommendation_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetails(
      {required MovieDetailsParameters parameter});

  Future<Either<Failure, List<MovieRecommendation>>> getMovieRecommendation(
      {required MovieRecommendationParameters parameter});
}
