import 'package:auto_route/auto_route.dart';

import '../../../modules/home/presentation/homePage.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
  ],
)

class $AppRouter {}
