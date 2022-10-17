import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  final String title;

  const Movie({
    required this.id,
    required this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
    required this.title,
  });

  @override
  List<Object> get props => [
        id,
        backdropPath,
        genreIds,
        overview,
        voteAverage,
        releaseDate,
        title,
      ];
}
