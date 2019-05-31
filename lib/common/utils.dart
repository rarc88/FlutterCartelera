final String _imageURLMedium = 'https://image.tmdb.org/t/p/w300/';
final String _imageURLLarge = 'https://image.tmdb.org/t/p/w500/';

String getMediumPictureURL(String path) => _imageURLMedium + path;
String getLargePictureURL(String path) => _imageURLLarge + path;