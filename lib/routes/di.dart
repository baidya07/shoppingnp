
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../modules/auth/di/injection.dart';
import 'auth_guard.dart';

final routeGuardProvider = Provider((ref) => RouteGuard(ref.watch(authProvider)));
// final routerProvider = Provider((ref) => AppRouter(routeGuard: ref.watch(routeGuardProvider)));
