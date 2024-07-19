import 'package:auto_route/auto_route.dart';
import 'package:film_search/constants.dart';
import 'package:film_search/presentation/bloc/bloc_status.dart';
import 'package:film_search/presentation/bloc/single_movie/single_movie_bloc.dart';
import 'package:film_search/presentation/view/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class DetailPage extends StatelessWidget {
  final int id;

  DetailPage({Key? key, required this.id}) : super(key: key);

  final _singleMovieBlocInstance = GetIt.instance<SingleMovieBloc>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    _singleMovieBlocInstance.add(
      GetSingleMovieEvent(id: id),
    );

    return Scaffold(
      body: BlocBuilder<SingleMovieBloc, SingleMovieState>(
        bloc: _singleMovieBlocInstance,
        builder: (context, state) {
          if (state.blocStatus == BlocStatus.NONE ||
              state.blocStatus == BlocStatus.LOADING) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.blocStatus == BlocStatus.ERROR) {
            return Center(
              child: Text(
                'Detail page didn\'t load. Error: ${state.error}',
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          var item = state.movie!;
          var genres = item.genres!.join(', ');

          return Stack(
            children: [
              // Background image
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('$kBackGroundImage${item.poster_path}'),
                    opacity: 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Content with scroll
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back button at the top left corner
                      Align(
                        alignment: Alignment.topLeft,
                        child: ElevatedButton(
                          onPressed: () {
                            context.router.pop();
                          },
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text('${item.title}', style: textTheme.displayLarge),
                      SizedBox(height: 8.0),
                      Text(
                        genres,
                        style: textTheme.titleMedium,
                      ),
                      SizedBox(height: 8.0),
                      Text('Description: ${item.overview}',
                          style: textTheme.headlineSmall),
                      SizedBox(height: 8.0),SizedBox(height: 8.0),
                      Text(
                          'Popularity: ${item.vote_average}',
                          style: textTheme.labelMedium
                      ),
                      Text('film id: ${item.id}', style: textTheme.labelSmall),

                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: DownNavigationBar(),
    );
  }
}
