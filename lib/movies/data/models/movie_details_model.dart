import 'package:movies_clean_arc/movies/data/models/genres_model.dart';
import 'package:movies_clean_arc/movies/domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel({
    required super.title,
    required super.genres,
    required super.id,
    required super.releaseDate,
    required super.backdropPath,
    required super.overview,
    required super.runtime,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      genres: List<GenresModel>.from(
        json['genres'].map(
          (e) => GenresModel.fromJson(e),
        ),
      ),
      overview: json['overview'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      voteAverage: json['vote_average'],
    );
  }
}
