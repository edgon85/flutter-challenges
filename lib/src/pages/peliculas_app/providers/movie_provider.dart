import 'package:challenges/modes/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '1a874ef005de067ae1ee5fe75031c734';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> onPopularMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;

  MoviesProvider() {
    this.getOnDisplaymovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(this._baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });

    final response = await http.get(url);
    return response.body;
  }

  /* <=========== Display Movies ===========================>  */
  getOnDisplaymovies() async {
    final jsonData = await this._getJsonData('/3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    this.onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  /* <=========== Popular Movies ===========================>  */
  getPopularMovies() async {
    this._popularPage++;

    final jsonData =
        await this._getJsonData('/3/movie/popular', this._popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    this.onPopularMovies = [...onPopularMovies, ...popularResponse.results];
    notifyListeners();
  }

  /* <=========== Popular Movies ===========================>  */
  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await this._getJsonData('/3/movie/$movieId/credits');
    final creditsResponse = CreditResponse.fromJson(jsonData);

    this.moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }
}
