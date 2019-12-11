import 'dart:async';

import 'package:movietask/model/nowplayingmodel.dart';
import 'package:movietask/services/moviesapi.dart';

class MovieRepository {
  final movieApi = MovieService();

  Future<NowPlayingMovie> fetchAllNowPlayingMovies() =>
      movieApi.getcurrentplaymovie();
}
