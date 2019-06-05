import 'package:cartelera/common/mediaProvider.dart';
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
  String getGenres() => getGenreValues(genreIDs);
  int getReleaseYear() {
    if(releaseDate == null || releaseDate == '') return 0;
    return DateTime.parse(releaseDate).year;
  }

  factory Media(Map json, MediaType mediaType) {
    try {
      return Media.deserialize(json, mediaType);
    } catch(e) {
      throw e;
    }
  }

  Media.deserialize(Map json, MediaType mediaType):
    id = json['id'].toInt(),
    voteAverage = json['vote_average'].toDouble(),
    title = json[mediaType == MediaType.movie ? 'title' : 'name'],
    posterPath = json['poster_path'] ?? '',
    backdropPath = json['backdrop_path'] ?? '',
    overview = json['overview'],
    releaseDate = json[mediaType == MediaType.movie ? 'release_date' : 'first_aire_date'],
    genreIDs = json['genre_ids'].toList();

}