import 'package:dartz/dartz.dart';
import 'package:movies_clean_arc/core/error/failure.dart';
import 'package:movies_clean_arc/movies/domain/entities/movie.dart';

abstract class BaseMoviesRepository {
  Future<Either< Failure ,List<Movie>>> getNowPlayingMovies();

  Future<Either< Failure ,List<Movie>>> getPopularMovies();

  Future<Either< Failure ,List<Movie>>> getTopRatedMovies();
}
