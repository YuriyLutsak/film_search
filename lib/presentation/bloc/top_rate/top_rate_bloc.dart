import 'package:dio/dio.dart';
import 'package:film_search/domain/entity/movie/movie.dart';
import 'package:film_search/presentation/bloc/bloc_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../data/repository/network.dart';

part 'top_rate_event.dart';

part 'top_rate_state.dart';

class TopRateBloc extends Bloc<TopRateEvent, TopRateState> {
   // var net = GetIt.instance<Network>();

  TopRateBloc() : super(TopRateState(blocStatus: BlocStatus.NONE)) {
    on<TopRateEvent>((event, emit) async {
      emit(state.copyWith(blocStatus: BlocStatus.LOADING));

      // try {
      //   Response? topRateResponse = await net.getTopRateResponse();
      //   var result = topRateResponse!.data as Map<String, dynamic>;
      //   List<dynamic> moviesInJson = result['results'];
      //
      //   List<Movie> movies = moviesInJson
      //       .map((e) => Movie.fromJson(e as Map<String, dynamic>))
      //       .toList();
      //   emit(
      //     state.copyWith(blocStatus: BlocStatus.LOADED, movies: movies),
      //   );
      // } catch (e) {
      //   emit(state.copyWith(
      //       blocStatus: BlocStatus.ERROR, error: 'top rate didn\'t loaded'));
      // }
    });
  }
}
