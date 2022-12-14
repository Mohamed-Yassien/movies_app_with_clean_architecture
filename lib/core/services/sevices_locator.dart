import 'package:get_it/get_it.dart';
import 'package:movies_clean_arc/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_clean_arc/movies/data/repository/movie_repository.dart';
import 'package:movies_clean_arc/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_clean_arc/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_clean_arc/movies/domain/usecases/get_movie_recommendation_usecase.dart';
import 'package:movies_clean_arc/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_clean_arc/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_clean_arc/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_clean_arc/movies/presentation/controller/movie_bloc.dart';
import 'package:movies_clean_arc/movies/presentation/controller/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///TODO BLOC
    sl.registerFactory(
      () => MovieBloc(
        getNowPlayingMoviesUseCase: sl(),
        getPopularMoviesUseCase: sl(),
        getTopRatedMoviesUseCase: sl(),
      ),
    );
    sl.registerFactory(() => MovieDetailsBloc(
        getMovieDetailsUseCase: sl(), getMovieRecommendationUseCase: sl()));

    /// TODO: USE_CASES
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(
      () => GetTopRatedMoviesUseCase(sl()),
    );
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(
        () => GetMovieRecommendationUseCase(baseMoviesRepository: sl()));

    ///TODO: REPOSITORY
    sl.registerLazySingleton<BaseMoviesRepository>(
      () => MovieRepository(
        baseMovieRemoteDataSource: sl(),
      ),
    );

    ///TODO: DATA SOURCES
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
