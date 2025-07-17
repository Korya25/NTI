import 'package:counter_app/core/router/app_routes.dart';
import 'package:counter_app/features/zikr/presentation/views/home_view.dart';
import 'package:counter_app/features/splash/presentation/views/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(path: AppRoutes.splash,
    name:  AppRoutes.splash,
       builder: (context, state) => const SplashScreen()),
      GoRoute(path: AppRoutes.homeView,
      name: AppRoutes.homeView,
       builder: (context, state) => const HomeView()),
    ],
  );
}
