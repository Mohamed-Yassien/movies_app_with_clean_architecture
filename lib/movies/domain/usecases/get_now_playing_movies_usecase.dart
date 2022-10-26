import 'package:dartz/dartz.dart';
import 'package:movies_clean_arc/core/use_case/base_usecase.dart';
import 'package:movies_clean_arc/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
 
class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>, NoParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameter parameter) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
