import 'package:dio/dio.dart';
import 'package:movies_clean_arc/core/error/exceptions.dart';
import 'package:movies_clean_arc/core/network/api_constance.dart';
import 'package:movies_clean_arc/core/network/error_message_model.dart';
import 'package:movies_clean_arc/movies/data/models/movie_details_model.dart';
import 'package:movies_clean_arc/movies/data/models/movie_model.dart';
import 'package:movies_clean_arc/movies/data/models/movie_recommendation_model.dart';
import 'package:movies_clean_arc/movies/domain/entities/movie_detail.dart';
import 'package:movies_clean_arc/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_clean_arc/movies/domain/usecases/get_movie_recommendation_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetail> getMovieDetails(
      {required MovieDetailsParameters parameter});

  Future<List<MovieRecommendationModel>> getMovieRecommendation(
      {required MovieRecommendationParameters parameters});
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.getNowPlayingPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.getPopularPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.getTopRatedPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<MovieDetail> getMovieDetails(
      {required MovieDetailsParameters parameter}) async {
    final response =
        await Dio().get(ApiConstance.getMovieDetails(movieId: parameter.id));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieRecommendationModel>> getMovieRecommendation(
      {required MovieRecommendationParameters parameters}) async {
    final response = await Dio().get(ApiConstance.getMovieRecommendationPath(
      movieId: parameters.id,
    ));

    if (response.statusCode == 200) {
      return List<MovieRecommendationModel>.from(response.data['results']
          .map((e) => MovieRecommendationModel.fromJson(e))).toList();
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
