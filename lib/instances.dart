// // setup_service_locator.dart
//
// import 'package:dio/dio.dart';
// import 'package:film_search/domain/entity/bookmarks/bookmarks.dart';
//
// import 'package:film_search/presentation/bloc/search/search_bloc.dart';
// import 'package:film_search/presentation/bloc/single_movie/single_movie_bloc.dart';
// import 'package:film_search/presentation/bloc/top_rate/top_rate_bloc.dart';
// import 'package:get_it/get_it.dart';
// import 'package:film_search/presentation/bloc/up_cuming/up_coming_bloc.dart';
// import 'package:film_search/dependency_injection.dart' as di;
//
// import 'data/repository/network.dart';
//
// final getIt = GetIt.instance;
//
// void setupServiceSingleton() {
//   // final dio = Dio();
//   // getIt.registerLazySingleton(() => dio);
//   // getIt.registerLazySingleton(() => Network(dio: dio));
//
//   try {
//     getIt.registerLazySingleton(() => TopRateBloc());
//     print('TopRateBloc registered successfully');
//   } catch (e) {
//     print('Error while creating TopRateBloc: $e');
//   }
//
//   try {
//     getIt.registerLazySingleton(() => UpComingBloc());
//     print('UpComingBloc registered successfully');
//   } catch (e) {
//     print('Error while creating UpComingBloc: $e');
//   }
//
//   try {
//     getIt.registerLazySingleton(() => SingleMovieBloc());
//     print('SingleMovieBloc registered successfully');
//   } catch (e) {
//     print('Error while creating SingleMovieBloc: $e');
//   }
//
//   // try {
//   //   getIt.registerLazySingleton(() => SearchBloc());
//   //   print('SearchBloc registered successfully');
//   // } catch (e) {
//   //   print('Error while creating SearchBloc: $e');
//   // }
//
//   try {
//     getIt.registerLazySingleton(() => Bookmarks());
//     print('Bookmarks registered successfully');
//   } catch (e) {
//     print('Error while creating Bookmarks: $e');
//   }
// }
