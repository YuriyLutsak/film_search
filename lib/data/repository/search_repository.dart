import 'package:film_search/data/remote_storage/search_service.dart';
import 'package:film_search/domain/entity/movie/movie.dart';
import 'package:film_search/domain/repository/i_search_repository.dart';

class SearchRepository implements ISearchRepository {

 final SearchService searchService;

  SearchRepository(this.searchService);

  @override
  Future<
      ({
        String? error,
        bool isSuccess,
        List<Movie>? movies,
      })> getSearchResult(String query) async {
    return searchService.getSearchResult(query);
  }
}
