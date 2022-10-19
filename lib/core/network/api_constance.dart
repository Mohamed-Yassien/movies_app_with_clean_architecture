class ApiConstance {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const apiKey = 'bdeda500907a0738ee12b53e1ac788aa';

  static const nowPlayingEndPoint = 'movie/now_playing';
  static const popularEndPoint = 'movie/popular';
  static const topRatedEndPoint = 'movie/top_rated';

  static const getNowPlayingPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const getPopularPath = '$baseUrl$popularEndPoint?api_key=$apiKey';
  static const getTopRatedPath = '$baseUrl$topRatedEndPoint?api_key=$apiKey';

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl (String path) => '$baseImageUrl$path';
}


// https://api.themoviedb.org/3/movie/now_playing?api_key=bdeda500907a0738ee12b53e1ac788aa
// https://api.themoviedb.org/3/movie/now_playing?api_key=bdeda500907a0738ee12b53e1ac788aaa