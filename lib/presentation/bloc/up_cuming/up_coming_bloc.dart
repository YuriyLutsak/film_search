import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:film_search/domain/entity/movie/movie.dart';
import 'package:film_search/presentation/bloc/bloc_status.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../data/repository/network.dart';

part 'up_coming_event.dart';

part 'up_coming_state.dart';

class UpComingBloc extends Bloc<UpComingEvent, UpComingState> {
  //var net = GetIt.instance<Network>();

  UpComingBloc() : super(UpComingState(blocStatus: BlocStatus.NONE)) {
    on<UpComingEvent>((event, emit) async {
      emit(state.copyWith(blocStatus: BlocStatus.LOADING));

      // try {
      //   Response? upcomingResponse = await net.getUpcomingResponse();
      //
      //   var upcomingResult = upcomingResponse!.data as Map<String, dynamic>;
      //   List<dynamic> moviesInJson = upcomingResult['results'];
      //   List<Movie> movies = moviesInJson
      //       .map((e) => Movie.fromJson(e as Map<String, dynamic>))
      //       .toList();
      //   emit(state.copyWith(blocStatus: BlocStatus.LOADED, movies: movies));
      // } catch (e) {
      //   emit(
      //     state.copyWith(
      //         blocStatus: BlocStatus.ERROR, error: 'upcoming didnt loaded'),
      //   );
      // }
    });
  }
}
