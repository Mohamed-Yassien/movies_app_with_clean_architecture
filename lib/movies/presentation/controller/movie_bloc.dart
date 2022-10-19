import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_arc/movies/presentation/controller/movie_event.dart';
import 'package:movies_clean_arc/movies/presentation/controller/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(const MovieState()) {
    on<GetNowPlayingEvent>((event, emit) {});
  }
}
