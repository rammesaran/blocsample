import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movietask/model/nowplayingmodel.dart';

class MovieService {
  final _apitoken = '5af9688122130d2f783da63d634c0641';
  final _baseurl = "https://api.themoviedb.org/3/movie";

  Future<NowPlayingMovie> getcurrentplaymovie() async {
    final response = await http.get("$_baseurl/now_playing?api_key=$_apitoken");

    if (response.statusCode == 200) {
      return NowPlayingMovie.fromJson(json.decode(response.body));
    } else {
      throw Exception('Something went wrong.');
    }
  }
}
