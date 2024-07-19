import 'package:auto_route/auto_route.dart';
import 'package:film_search/config/routes/app_router.gr.dart';
import 'package:film_search/constants.dart';
import 'package:film_search/domain/entity/bookmarks/bookmarks.dart';
import 'package:film_search/feature/up_button_to_add.dart';
import 'package:film_search/presentation/bloc/bloc_status.dart';
import 'package:film_search/presentation/bloc/top_rate/top_rate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HorizonScrollItem extends StatelessWidget {
  HorizonScrollItem({super.key});

  final _topRateBlocInstance = GetIt.instance<TopRateBloc>();
  final _bookmarksInstance = GetIt.instance<Bookmarks>();

  @override
  Widget build(BuildContext context) {
    _topRateBlocInstance.add(GetTopRateEvent());
    var textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: 200, // Высота для горизонтального ListView.builder
          child: BlocBuilder<TopRateBloc, TopRateState>(
            bloc: _topRateBlocInstance,
            builder: (context, state) {
              if (state.blocStatus == BlocStatus.LOADING ||
                  state.blocStatus == BlocStatus.NONE) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.blocStatus == BlocStatus.ERROR) {
                return Text('${state.error!} we need hive');
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.movies?.length ?? 0,
                itemBuilder: (context, index) {
                  var item = state.movies![index];
                  return GestureDetector(
                    onTap: () => context.router
                        .push(DetailRoute(id: state.movies![index].id)),
                    child: Container(
                      width: constraints.maxWidth / 3,
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        image: item.poster_path != null
                            ? DecorationImage(
                                image: NetworkImage(
                                    '$kBackGroundImage${item.poster_path}'),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0.01,
                            child: StarButton(
                              isStarred:
                                  _bookmarksInstance.isMovieBookmarked(item),
                              onPressed: () {
                                if (_bookmarksInstance
                                    .isMovieBookmarked(item)) {
                                  _bookmarksInstance
                                      .removeMovieFromBookmark(item);
                                } else {
                                  _bookmarksInstance.addMovieToBookmark(item);
                                }
                              },
                            ),
                          ),
                          Positioned(
                            bottom: 8.0,
                            left: 8.0,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              color: Colors.black12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${item.title}",
                                    style: textTheme.bodyMedium,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'Rating: ${item.vote_average}',
                                    style: textTheme.bodySmall,
                                  ),
                                  if (item.poster_path == null)
                                    Text(
                                      'Image not available',
                                      style: textTheme.bodyLarge,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
