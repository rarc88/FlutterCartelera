import 'dart:async';
import 'dart:convert';
import 'package:cartelera/models/media.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';
import 'mediaProvider.dart';

class HttpHandle {

  static final _httpHandler = HttpHandle();

  final String _apiURL = 'api.themoviedb.org';
  final String _language = 'es-ES';

  static HttpHandle get() {
    return _httpHandler;
  }

  Future<dynamic> getJSON(Uri uri) async {
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  Future<List<Media>> fetchMovies({String category : 'popular'}) async {
    var uri = Uri.https(
      _apiURL,
      '3/movie/$category',
      {
        'api_key': API_KEY,
        'page': '1',
        'language': _language
      }
    );
    return getJSON(uri)
      .then((data) =>
        data['results'].map<Media>((item) =>
          Media(item, MediaType.movie)
        ).toList()
      );
  }

  Future<List<Media>> fetchShow({String category : 'popular'}) async {
    var uri = Uri.https(
      _apiURL,
      '3/tv/$category',
      {
        'api_key': API_KEY,
        'page': '1',
        'language': _language
      }
    );
    return getJSON(uri)
      .then((data) =>
        data['results'].map<Media>((item) =>
          Media(item, MediaType.show)
        ).toList()
      );
  }

}