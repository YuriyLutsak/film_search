import 'package:auto_route/auto_route.dart';
import 'package:film_search/constants.dart';
import 'package:film_search/presentation/bloc/bloc_status.dart';
import 'package:film_search/presentation/bloc/up_cuming/up_coming_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../config/routes/app_router.gr.dart';

class VerticalScrollItem extends StatelessWidget {
  VerticalScrollItem({super.key});

  final UpComingBloc _upComingBlocInstance = GetIt.instance<UpComingBloc>();

  @override
  Widget build(BuildContext context) {
    _upComingBlocInstance.add(GetUpComingEvent());

    return BlocBuilder<UpComingBloc, UpComingState>(
      bloc: _upComingBlocInstance,
      builder: (context, state) {
        if (state.blocStatus == BlocStatus.NONE ||
            state.blocStatus == BlocStatus.LOADING) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.blocStatus == BlocStatus.ERROR) {
          return Center(child: Text('${state.error!} + we need hive'));
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            var textTheme = Theme.of(context).textTheme;
            var item = state.movies![index];
            var imageUrl = '$kBackGroundImage${item.poster_path}';
            // print('Image URL: $imageUrl'); // Вывод URL в консоль

            return GestureDetector(
              onTap: () =>
                  context.router.push(DetailRoute(id: state.movies![index].id)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    // Используем ширину экрана
                    height: MediaQuery.of(context).size.width / 3 * 1.5,
                    // Задаем высоту в соотношении 3:2
                    margin: const EdgeInsets.all(8.0),
                    color: Colors.grey[300],
                    // Цвет фона для проверки видимости контейнера
                    child: item.poster_path != null
                        ? Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                              return progress == null
                                  ? child
                                  : Center(child: CircularProgressIndicator());
                            },
                            errorBuilder: (context, error, stackTrace) {
                              print('Error loading image: $error');
                              return Center(child: Text('Error loading image'));
                            },
                          )
                        : const Center(child: Text('No Image')),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${item.title}',
                          style: textTheme.bodyMedium,
                        ),
                        Text('Rating: ${item.vote_average}',
                            style: textTheme.bodyLarge),
                        Text(
                          'Description: ${item.overview}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 7,
                          style: textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
