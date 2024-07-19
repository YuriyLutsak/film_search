import 'package:dio/dio.dart';
import 'package:film_search/constants.dart';
import 'package:film_search/data/network_service/film_search_api_service.dart';
import 'package:film_search/domain/entity/movie/movie.dart';

final class SearchService {
  Future<
      ({
        bool isSuccess,
        List<Movie>? movies,
        String? error,
      })> getSearchResult(String query) async {
    try {
      Response? response = await get('/search/movie', queryParameters: {
        'query': query,
        'include_adult': false,
        'language': 'en-US',
        'page': 1,
        'api_key': kApiKey,
      });

      var result = response!.data as Map<String, dynamic>;
      List<dynamic> moviesInJson = result['results'];
      List<Movie> movies = moviesInJson
          // .map((e) {
          //   print(e['id']);
          //   return e;
          // })  .map((e) {
          //   print(e['id'] as num);
          //   print(e['title'] as String);
          //   print(e['overview'] as String);
          //   print(e['vote_average'] as num);
          //   print(e['poster_path'] as String);
          //   print('======================================================================');
          //   return e;
          // })
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList();

      return (
        isSuccess: true,
        movies: movies,
        error: null,
      );
    } on DioException catch (e) {
      final result = e.response?.data as Map<String, dynamic>?;
      return (
        isSuccess: false,
        movies: null,
        error:
            result?['status_message']?.toString() ?? 'Unknown error occurred',
      );
    }
  }
}
