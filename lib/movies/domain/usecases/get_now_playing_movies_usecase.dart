import 'package:dartz/dartz.dart';
import 'package:movies_clean_arc/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  Future<Either< Failure ,List<Movie>>> execute() async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}