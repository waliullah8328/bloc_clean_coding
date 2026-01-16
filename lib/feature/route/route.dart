import 'package:go_router/go_router.dart';

import '../home/view/home_screen.dart';
import '../splash/view/splash_screen.dart';
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


    ],
  );
}