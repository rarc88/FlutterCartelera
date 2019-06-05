import 'dart:async';
import 'package:cartelera/common/httpHandle.dart';
import 'package:cartelera/models/media.dart';

abstract class MediaProvider {
  Future<List<Media>> fetchMedia(String category);
}

class MovieProvider extends MediaProvider {
  HttpHandle _client = HttpHandle.get();
  @override
  Future<List<Media>> fetchMedia(String category) {
    return _client.fetchMovies(category: category);
  }
}

class ShowProvider extends MediaProvider {
  HttpHandle _client = HttpHandle.get();
  @override
  Future<List<Media>> fetchMedia(String category) {
    return _client.fetchShow(category: category);
  }
}

enum MediaType { movie, show }