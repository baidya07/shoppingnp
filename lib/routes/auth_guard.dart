import 'package:auto_route/auto_route.dart';

import '../modules/auth/presentation/provider/auth_notifier.dart';

class RouteGuard extends AutoRedirectGuard {
  final AuthNotifier authService;

  RouteGuard(this.authService) {
    authService.addListener((_) {
      if (!authService.state) {
        // should be called when the logic effecting this guard changes
        // e.g when the user is no longer authenticated
        reevaluate();
      }
    });
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authService.state == true) {
      print('Authenticated');
      return resolver.next();
    } else {
      print('UnAuthorized');
      // router.push(
      //   LoginRoute(
      //     onLoginCallback: (_) {
      //       resolver.next();
      //       router.removeLast();
      //     },
      //   ),
      // );
    }
  }
}
