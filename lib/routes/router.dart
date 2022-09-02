import 'package:auto_route/auto_route.dart';

import '../modules/home/presentation/homePage.dart';
import '../views/screens/home/home_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage,),
    AutoRoute(page: NewHomeScreen, initial: true),
  ],
)

class $AppRouter {}
