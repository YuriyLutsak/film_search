import 'package:auto_route/auto_route.dart';
import 'package:film_search/presentation/view/bookmarks.dart';
import 'package:film_search/presentation/view/search.dart';
import 'package:flutter/material.dart';

import '../../config/routes/app_router.gr.dart';
import '../../main.dart';

import 'package:film_search/dependency_injection.dart' as di;


class DownNavigationBar extends StatefulWidget {
  const DownNavigationBar({super.key});

  @override
  State<DownNavigationBar> createState() => _DownNavigationBarState();
}

class _DownNavigationBarState extends State<DownNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
            // Navigate to a route based on the selected index
            switch (index) {
              case 0:
                context.router.push(HomeRoute());
                break;
              case 1:
                context.router.push(SearchRoute());
                break;
              case 2:
                context.router.push(BookmarksRoute());
                break;
              default:
                break;
            }
          });
        },
        destinations: [
          NavigationDestination(
              selectedIcon: Icon(Icons.home_outlined),
              icon: Icon(Icons.home),
              label: ''),
          NavigationDestination(
              selectedIcon: Icon(Icons.search_outlined),
              icon: Icon(Icons.search),
              label: ''),
          NavigationDestination(
              selectedIcon: Icon(Icons.bookmark_add_outlined),
              icon: Icon(Icons.bookmark_add),
              label: '')
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomePage(), // Replace with your home screen widget
          SearchPage(), // Replace with your search screen widget
          BookmarksPage(), // Replace with your bookmark screen widget
        ],
      ),
    );
  }
}
// import 'package:auto_route/auto_route.dart';
// import 'package:film_search/presentation/view/bookmarks.dart';
// import 'package:film_search/presentation/view/search.dart';
// import 'package:flutter/material.dart';
//
// import '../../config/routes/app_router.gr.dart';
// import '../../main.dart';
//
// class DownNavigationBar extends StatefulWidget {
//   const DownNavigationBar({super.key});
//
//   @override
//   State<DownNavigationBar> createState() => _DownNavigationBarState();
// }
//
// class _DownNavigationBarState extends State<DownNavigationBar> {
//   int _selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: IndexedStack(
//             index: _selectedIndex,
//             children: [
//               HomePage(), // Replace with your home screen widget
//               SearchPage(), // Replace with your search screen widget
//               BookmarksPage(), // Replace with your bookmark screen widget
//             ],
//           ),
//         ),
//         NavigationBar(
//           selectedIndex: _selectedIndex,
//           onDestinationSelected: (int index) {
//             setState(() {
//               _selectedIndex = index;
//               // Navigate to a route based on the selected index
//               switch (index) {
//                 case 0:
//                   context.router.push(HomeRoute());
//                   break;
//                 case 1:
//                   context.router.push(SearchRoute());
//                   break;
//                 case 2:
//                   context.router.push(BookmarksRoute());
//                   break;
//                 default:
//                   break;
//               }
//             });
//           },
//           destinations: [
//             NavigationDestination(
//                 selectedIcon: Icon(Icons.home_outlined),
//                 icon: Icon(Icons.home),
//                 label: ''),
//             NavigationDestination(
//                 selectedIcon: Icon(Icons.search_outlined),
//                 icon: Icon(Icons.search),
//                 label: ''),
//             NavigationDestination(
//                 selectedIcon: Icon(Icons.bookmark_add_outlined),
//                 icon: Icon(Icons.bookmark_add),
//                 label: '')
//           ],
//         ),
//       ],
//     );
//   }
// }
