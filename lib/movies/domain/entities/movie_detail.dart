import 'package:equatable/equatable.dart';
import 'package:movies_clean_arc/movies/domain/entities/genres.dart';

class MovieDetail extends Equatable {
  final int id;
  final List<Genres> genres;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final int runtime;
  final double voteAverage;
  final String title;

  const MovieDetail({
    required this.title,
    required this.genres,
    required this.id,
    required this.releaseDate,
    required this.backdropPath,
    required this.overview,
    required this.runtime,
    required this.voteAverage,
  });

  @override
  List<Object> get props => [
        id,
        backdropPath,
        overview,
        releaseDate,
        runtime,
        voteAverage,
        title,
        genres,
      ];
}
