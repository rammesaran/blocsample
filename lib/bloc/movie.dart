import 'package:movietask/model/nowplayingmodel.dart';
import 'package:movietask/repository/movierep.dart';
import 'package:rxdart/rxdart.dart';

class MovieList {
  final _repository = MovieRepository();
  final _nowplay = PublishSubject<NowPlayingMovie>();

  Observable<NowPlayingMovie> get allNowPlayingMovies => _nowplay.stream;

  fetchAllNowPlayingMovies() async {
    NowPlayingMovie nowPlayingMoviesModel =
        await _repository.fetchAllNowPlayingMovies();
    _nowplay.sink.add(nowPlayingMoviesModel);
  }

  dispose() {
    _nowplay?.close();
  }
}

final bloc = MovieList();
