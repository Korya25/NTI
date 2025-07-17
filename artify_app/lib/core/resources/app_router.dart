import 'package:artify_app/core/resources/app_routes.dart';
import 'package:artify_app/features/home/presentation/views/collection_view.dart';
import 'package:artify_app/features/home/presentation/views/detail_view.dart';
import 'package:artify_app/features/home/presentation/views/home_view.dart';
import 'package:artify_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.onboarding,
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: AppRoutes.detail,
        name: AppRoutes.detail,
        builder: (context, state) => const DetailView(),
      ),
      GoRoute(
        path: AppRoutes.collection,
        name: AppRoutes.collection,
        builder: (context, state) => const CollectionView(),
      ),
    ],
  );
}
