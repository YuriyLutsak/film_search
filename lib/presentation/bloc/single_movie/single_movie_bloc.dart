import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:film_search/data/repository/network.dart';
import 'package:film_search/domain/entity/movie/movie.dart';
import 'package:film_search/presentation/bloc/bloc_status.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'single_movie_event.dart';

part 'single_movie_state.dart';

class SingleMovieBloc extends Bloc<SingleMovieEvent, SingleMovieState> {
 // var net = GetIt.instance<Network>();

  SingleMovieBloc() : super(SingleMovieState(blocStatus: BlocStatus.NONE)) {
    on<GetSingleMovieEvent>((event, emit) async {
      emit(state.copyWith(blocStatus: BlocStatus.LOADING));

      // try {
      //   Response? movieByIdResponse = await net.getMovieByIdResponse(event.id);
      //
      //   var movieInJson = movieByIdResponse!.data as Map<String, dynamic>;
      //
      //   Movie movieFromJson = Movie.fromJson(movieInJson);
      //
      //   emit(
      //     state.copyWith(blocStatus: BlocStatus.LOADED, movie: movieFromJson),
      //   );
      // } catch (e) {
      //   emit(state.copyWith(
      //       blocStatus: BlocStatus.ERROR, error: 'movie by id didn\'t loaded'));
      // }
    });
  }
}
