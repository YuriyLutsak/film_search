import 'package:film_search/domain/repository/i_search_repository.dart';

import '../entity/movie/movie.dart';

abstract interface class ISearchUsecase {
  Future<
      ({
        bool isSuccess,
        List<Movie>? movies,
        String? error,

      })> call(String query);
}

class SearchUsecase implements ISearchUsecase {
  final ISearchRepository searchRepository;

  SearchUsecase(this.searchRepository);

  @override
  Future<
      ({
        String? error,
        bool isSuccess,
        List<Movie>? movies,
      })> call(String query) async{
    return searchRepository.getSearchResult(query);
  }
}
