import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_clean_arc/core/error/failure.dart';
import 'package:movies_clean_arc/core/use_case/base_usecase.dart';
import 'package:movies_clean_arc/movies/domain/entities/movie_detail.dart';
import 'package:movies_clean_arc/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetail , MovieDetailsParameters> {

  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParameters parameter) async{
    return await baseMoviesRepository.getMovieDetails(parameter: parameter);
  }
}

class MovieDetailsParameters extends Equatable {
  final int id;

  const MovieDetailsParameters({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
