import 'package:go_router/go_router.dart';

import '../../feature/home/view/home_screen.dart';
import '../../feature/login/view/login_screen.dart';
import '../../feature/reciter/reciter_view/reciter_screen.dart';
import '../../feature/splash/view/splash_screen.dart';
import 'app_route_name.dart';


class Routes {
  static final GoRouter goRouter = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppRouteNames.splashScreen,
    routes: [
      GoRoute(
        path: AppRouteNames.splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: AppRouteNames.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRouteNames.loginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: AppRouteNames.reciterScreen,
        builder: (context, state) => ReciterScreen(),
      ),


    ],
  );
}