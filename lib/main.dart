// import 'package:auto_route/auto_route.dart';
// import 'package:film_search/config/routes/app_router.dart';
// import 'package:film_search/instances.dart';
// import 'package:film_search/presentation/view/horizontal_scroll_items.dart';
// import 'package:film_search/presentation/view/vertical_scroll_item.dart';
// import 'package:film_search/theme/themes_of_app.dart';
// import 'package:flutter/material.dart';
//
// import 'presentation/view/bottom_navigation_bar.dart';
//
// void main() {
//   setupServiceSingleton();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     AppRouter router = AppRouter();
//     return MaterialApp.router(
//       theme: darkTheme,
//       routerConfig: router.config(),
//     );
//   }
// }
//
// @RoutePage()
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             HorizonScrollItem(),
//             Container(
//               alignment: Alignment.bottomLeft,
//               child: Text(
//                 'Coming soon:',
//                 style: Theme.of(context).textTheme.headlineSmall,
//               ),
//             ),
//             VerticalScrollItem(),
//           ],
//         ),
//       ),
//         bottomNavigationBar: DownNavigationBar(),
//     );
//   }
// }
import 'package:auto_route/auto_route.dart';
import 'package:film_search/config/routes/app_router.dart';
import 'package:film_search/instances.dart';
import 'package:film_search/presentation/view/horizontal_scroll_items.dart';
import 'package:film_search/presentation/view/vertical_scroll_item.dart';
import 'package:film_search/theme/themes_of_app.dart';
import 'package:flutter/material.dart';
import 'package:film_search/dependency_injection.dart' as di;


import 'config/routes/app_router.gr.dart';
import 'presentation/view/bottom_navigation_bar.dart';

void main() {
 // setupServiceSingleton();
  di.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter router = AppRouter();
    return MaterialApp.router(
      theme: darkTheme,
      routerConfig: router.config(),
    );
  }
}

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                HorizonScrollItem(),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Coming soon:',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                VerticalScrollItem(),

              ],
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: DownNavigationBar(),
          // ),

        ],
      ),
   //   floatingActionButton: FloatingActionButton(onPressed: () {  context.router.push(SearchRoute()); },),
    );

  }
}
