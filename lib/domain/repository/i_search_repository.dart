import 'package:film_search/domain/entity/movie/movie.dart';

abstract interface class ISearchRepository {
  Future<
      ({
        String? error,
        bool isSuccess,
        List<Movie>? movies,
      })> getSearchResult(String query);
}
