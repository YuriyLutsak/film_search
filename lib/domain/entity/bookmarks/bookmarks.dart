import 'package:film_search/domain/entity/movie/movie.dart';

class Bookmarks {
  List<Movie> moviesInBookmark = [];

  void addMovieToBookmark(Movie item) {
    moviesInBookmark.add(item);
  }

  void removeMovieFromBookmark(Movie item) {
    moviesInBookmark.remove(item);
  }

  bool isMovieBookmarked(Movie item) {
    return moviesInBookmark.contains(item);
  }
}
