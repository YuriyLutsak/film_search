import 'package:film_search/data/network_service/network_service.dart';
import 'package:film_search/data/remote_storage/search_service.dart';
import 'package:film_search/data/repository/network.dart';
import 'package:film_search/data/repository/search_repository.dart';
import 'package:film_search/domain/entity/bookmarks/bookmarks.dart';
import 'package:film_search/domain/repository/i_search_repository.dart';
import 'package:film_search/domain/usecase/search_usecase.dart';
import 'package:film_search/presentation/bloc/search/search_bloc.dart';
import 'package:film_search/presentation/bloc/single_movie/single_movie_bloc.dart';
import 'package:film_search/presentation/bloc/top_rate/top_rate_bloc.dart';
import 'package:film_search/presentation/bloc/up_cuming/up_coming_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt
    // ..registerSingleton<Network>(Network(dio: NetworkService.instance.dio))
    //SERVICES
    ..registerLazySingleton<SearchService>(
      () => SearchService(),
    )..registerLazySingleton<Bookmarks>(
      () => Bookmarks(),
    )

    //REPOSITORIES
    ..registerLazySingleton<ISearchRepository>(
      () => SearchRepository(
        getIt.get(),
      ),
    )

    //USECASES
    ..registerLazySingleton<ISearchUsecase>(
      () => SearchUsecase(
        getIt.get(),
      ),
    )

    //BLOCS
    ..registerLazySingleton<SearchBloc>(
      () => SearchBloc(
        getIt.get(),
      ),
    )
    ..registerLazySingleton<SingleMovieBloc>(
      () => SingleMovieBloc(),
    )
    ..registerLazySingleton<TopRateBloc>(
      () => TopRateBloc(),
    )
    ..registerLazySingleton<UpComingBloc>(
      () => UpComingBloc(),
    );
}
