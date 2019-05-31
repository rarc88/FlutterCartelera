import 'package:cartelera/common/utils.dart';

class Media {
  int id;
  double voteAverage;
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate;
  List<dynamic> genreIDs;

  String getPosterURL() => getMediumPictureURL(posterPath);
  String getbackdropURL() => getLargePictureURL(backdropPath);

  factory Media(Map json) {
    try {
      return Media.deserialize(json);
    } catch(e) {
      throw e;
    }
  }

  Media.deserialize(Map json):
    id = json['id'].toInt(),
    voteAverage = json['vote_average'].toDouble(),
    title = json['title'],
    posterPath = json['poster_path'] ?? '',
    backdropPath = json['backdrop_path'] ?? '',
    overview = json['overview'],
    releaseDate = json['release_date'],
    genreIDs = json['genre_ids'].toList();

}