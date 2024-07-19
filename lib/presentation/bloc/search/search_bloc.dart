import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:film_search/data/repository/network.dart';
import 'package:film_search/domain/entity/movie/movie.dart';
import 'package:film_search/domain/repository/i_search_repository.dart';
import 'package:film_search/domain/usecase/search_usecase.dart';
import 'package:film_search/presentation/bloc/bloc_status.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ISearchUsecase _searchUsecase;

  SearchBloc(this._searchUsecase)
      : super(SearchState(blocStatus: BlocStatus.NONE)) {
    // var net = GetIt.instance<Network>();

    on<GetSearchEvent>((event, emit) async {
      emit(state.copyWith(blocStatus: BlocStatus.LOADING));
final result = await _searchUsecase(event.query);
if(result.isSuccess){
  emit(state.copyWith(blocStatus: BlocStatus.LOADED, movies: result.movies,),);
} else {
  emit(state.copyWith(blocStatus: BlocStatus.ERROR, error: result.error,),);
}
      // try {
      //   Response? response = await net.searchMovies(event.query);
      //
      //   if (response == null || response.data == null) {
      //     throw Exception('No data received from the API');
      //   }
      //
      //   // var result = response.data as Map<String, dynamic>;
      //   //  print('API Response: $result'); // Print the entire response
      //
      //   // List<dynamic> moviesInJson = result['results'];
      //   // List<Movie> movies = moviesInJson
      //   //     // .map((e) {
      //   //     //   print(e['id']);
      //   //     //   return e;
      //   //     // })  .map((e) {
      //   //     //   print(e['id'] as num);
      //   //     //   print(e['title'] as String);
      //   //     //   print(e['overview'] as String);
      //   //     //   print(e['vote_average'] as num);
      //   //     //   print(e['poster_path'] as String);
      //   //     //   print('======================================================================');
      //   //     //   return e;
      //   //     // })
      //   //     .map((e) => Movie.fromJson(e as Map<String, dynamic>))
      //   //     .toList();
      //
      //   emit(state.copyWith(blocStatus: BlocStatus.LOADED, movies: movies));
      // } catch (e) {
      //   print('Error: $e'); // Log the error
      //   emit(state.copyWith(
      //       blocStatus: BlocStatus.ERROR,
      //       error: 'Failed to load search results'));
      // }
    });
  }
}
