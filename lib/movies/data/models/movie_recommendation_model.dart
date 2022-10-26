import 'package:movies_clean_arc/movies/domain/entities/movie_recommendation.dart';

class MovieRecommendationModel extends MovieRecommendation {
  const MovieRecommendationModel({
    required super.id,
    super.backdropPath,
  });

  factory MovieRecommendationModel.fromJson(Map<String,dynamic> json) {
    return MovieRecommendationModel(
      id: json['id'],
      backdropPath: json['backdrop_path'] ?? '/5luJmy21N3bYCkjzRHsoZfvLtPP.jpg',
    );
  }
}
