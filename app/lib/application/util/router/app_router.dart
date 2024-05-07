import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(routes: AppRouter.routes);

class AppRouter {
  static List<GoRoute> routes = [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return const PrivacyPolicyScreen();
      },
    ),
  ];
}
