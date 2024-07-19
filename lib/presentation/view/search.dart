import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:film_search/constants.dart';
import 'package:film_search/presentation/bloc/bloc_status.dart';
import 'package:film_search/presentation/bloc/search/search_bloc.dart';
import 'package:film_search/presentation/view/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:film_search/dependency_injection.dart' as di;

import '../../config/routes/app_router.gr.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  final SearchBloc _searchBlocInstance = di.getIt.get();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Enter movie...',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    String query = _textController.text;
                  //  _searchBlocInstance.add(GetSearchEvent(query: query));
                  },
                  child: Icon(Icons.search),
                ),
              ],
            ),
            SizedBox(height: 20),
            // BlocBuilder<SearchBloc, SearchState>(
            //   bloc: _searchBlocInstance,
            //   builder: (context, state) {
            //     if (state.blocStatus == BlocStatus.NONE) {
            //       return Center(child: Icon(Icons.search));
            //     }
            //     if (state.blocStatus == BlocStatus.LOADING) {
            //       return Center(child: CircularProgressIndicator());
            //     }
            //     if (state.blocStatus == BlocStatus.ERROR) {
            //       print('Error: ${state.error}'); // Log the error
            //       return Center(
            //           child: Text('An error occurred: ${state.error}'));
            //     }
            //     if (state.blocStatus == BlocStatus.LOADED &&
            //         state.movies != null) {
            //       return Expanded(
            //         child: ListView.builder(
            //           itemCount: state.movies!.length,
            //           itemBuilder: (BuildContext context, int index) {
            //             var item = state.movies![index];
            //             var imageUrl = '$kBackGroundImage${item.poster_path}';
            //             return GestureDetector(
            //               onTap: () {
            //                 context.router.push(DetailRoute(id: item.id));
            //               },
            //               child: Padding(
            //                 padding: const EdgeInsets.symmetric(vertical: 8.0),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Container(
            //                       width: MediaQuery.of(context).size.width / 3,
            //                       height: MediaQuery.of(context).size.width /
            //                           3 *
            //                           1.5,
            //                       margin: const EdgeInsets.all(8.0),
            //                       color: Colors.grey[300],
            //                       child: item.poster_path != null
            //                           ? Image.network(
            //                               imageUrl,
            //                               fit: BoxFit.cover,
            //                               loadingBuilder:
            //                                   (context, child, progress) {
            //                                 return progress == null
            //                                     ? child
            //                                     : Center(
            //                                         child:
            //                                             CircularProgressIndicator());
            //                               },
            //                               errorBuilder:
            //                                   (context, error, stackTrace) {
            //                                 print(
            //                                     'Error loading image: $error');
            //                                 return Center(
            //                                     child: Text(
            //                                         'Error loading image'));
            //                               },
            //                             )
            //                           : const Center(child: Text('No Image')),
            //                     ),
            //                     const SizedBox(width: 10),
            //                     Expanded(
            //                       child: Column(
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         children: [
            //                           Text('${item.title}', style: textTheme.titleMedium,),
            //                           Text('Rating: ${item.vote_average}', style: textTheme.titleSmall,),
            //                           Text(
            //                             'Description: ${item.overview}',
            //                             overflow: TextOverflow.ellipsis,
            //                             maxLines: 7,
            //                             style: textTheme.bodySmall,
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             );
            //           },
            //         ),
            //       );
            //     }
            //     return Container();
            //   },
            // ),
          ],
        ),
      ),
      bottomNavigationBar: DownNavigationBar(), // Ensure this is correct
    );
  }
}
