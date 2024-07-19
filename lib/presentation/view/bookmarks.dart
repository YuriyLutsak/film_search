import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:film_search/config/routes/app_router.gr.dart';
import 'package:film_search/constants.dart';
import 'package:film_search/domain/entity/bookmarks/bookmarks.dart';
import 'package:film_search/presentation/view/bottom_navigation_bar.dart';

import 'package:film_search/dependency_injection.dart' as di;


@RoutePage()
class BookmarksPage extends StatefulWidget {
  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  late Bookmarks bookmarksInstance;

  @override
  Widget build(BuildContext context) {
    var textThem = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  child: Icon(Icons.arrow_back),
                ),
                SizedBox(width: 8.0),
                Text(
                  'Bookmarks',
                  style: textThem.titleLarge,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bookmarksInstance.moviesInBookmark.length,
              itemBuilder: (context, index) {
                var item = bookmarksInstance.moviesInBookmark[index];
                var imageUrl = '$kBackGroundImage${item.poster_path}';
                return GestureDetector(
                  onTap: () {
                    context.router.push(DetailRoute(id: item.id));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.width / 3 * 1.5,
                          margin: const EdgeInsets.all(8.0),
                          color: Colors.grey[300],
                          child: item.poster_path != null
                              ? Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (context, child, progress) {
                                    return progress == null
                                        ? child
                                        : Center(
                                            child: CircularProgressIndicator());
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    print('Error loading image: $error');
                                    return Center(
                                        child: Text('Error loading image'));
                                  },
                                )
                              : const Center(child: Text('No Image')),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${item.title}',
                                style: textThem.titleLarge,
                              ),
                              Text(
                                'Rating: ${item.vote_average}',
                                style: textThem.titleSmall,
                              ),
                              Text(
                                'Description: ${item.overview}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 7,
                                style: textThem.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
     // bottomNavigationBar: DownNavigationBar(),
    );
  }

  @override
  void initState() {
    bookmarksInstance = di.getIt.get();
  }
}
