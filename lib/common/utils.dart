final String _imageURLMedium = 'https://image.tmdb.org/t/p/w300/';
final String _imageURLLarge = 'https://image.tmdb.org/t/p/w500/';

String getMediumPictureURL(String path) => _imageURLMedium + path;
String getLargePictureURL(String path) => _imageURLLarge + path;

Map<int, String> _genreMap = {
  28: 'Acción',
  12: 'Aventura',
  16: 'Animación',
  35: 'Comedia',
  80: 'Crimen',
  99: 'Documental',
  18: 'Drama',
  10751: 'Familia',
  14: 'Fantasía',
  36: 'Historia',
  27: 'Terror',
  10402: 'Música',
  9648: 'Misterio',
  10749: 'Romance',
  878: 'Ciencia ficción',
  10770: 'película de la televisión',
  53: 'Suspenso',
  10752: 'Guerra',
  37: 'Oeste',
  10759: 'Acción & Aventura',
  10762: "Infantil",
  10763: 'Noticias',
  10764: 'Realities',
  10765: 'Sci-Fi & Fantasia',
  10766: 'Serial',
  10767: 'Conversación',
  10768: 'Guerra & Politica',
};

List<String> genresToList(List<dynamic> genreIDs) =>
  genreIDs.map((id) => _genreMap[id]).toList();

String getGenreValues(List<dynamic> genreIDs) {
  StringBuffer buffer = StringBuffer();
  buffer.writeAll(genresToList(genreIDs), ', ');
  return buffer.toString();
}