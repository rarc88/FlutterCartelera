import 'dart:async';
import 'dart:convert';
import 'package:cartelera/models/media.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';

class HttpHandle {

  final String _apiURL = 'api.themoviedb.org';
  final String _language = 'es-ES';

  Future<dynamic> getJSON(Uri uri) async {
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  Future<List<Media>> fetchMovies() {
    var uri = Uri.https(
      _apiURL,
      '3/movie/popular',
      {
        'api_key': API_KEY,
        'page': '1',
        'language': _language
      }
    );
    return getJSON(uri)
      .then((data) =>
        data['results'].map<Media>((item) =>
          Media(item)
        ).toList()
      );
  }

}