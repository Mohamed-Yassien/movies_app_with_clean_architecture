import 'package:dartz/dartz.dart';
import 'package:movies_clean_arc/core/error/exceptions.dart';
import 'package:movies_clean_arc/core/error/failure.dart';
import 'package:movies_clean_arc/movies/domain/entities/movie.dart';
import 'package:movies_clean_arc/movies/domain/entities/movie_detail.dart';
import 'package:movies_clean_arc/movies/domain/entities/movie_recommendation.dart';
import 'package:movies_clean_arc/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_clean_arc/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_clean_arc/movies/domain/usecases/get_movie_recommendation_usecase.dart';

import '../datasource/movie_remote_data_source.dart';

class MovieRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository({
    required this.baseMovieRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      {required MovieDetailsParameters parameter}) async {
    final result =
        await baseMovieRemoteDataSource.getMovieDetails(parameter: parameter);
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return left(
        ServerFailure(message: failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieRecommendation>>> getMovieRecommendation(
      {required MovieRecommendationParameters parameter}) async {
    final result = await baseMovieRemoteDataSource.getMovieRecommendation(
        parameters: parameter);
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }
}
