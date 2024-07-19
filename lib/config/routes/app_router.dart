import 'package:auto_route/auto_route.dart';


//part  'app_router.gr.dart';
import   'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: DetailRoute.page),
    AutoRoute(page: SearchRoute.page, initial: true),
    AutoRoute(page: BookmarksRoute.page),


  ];
}
