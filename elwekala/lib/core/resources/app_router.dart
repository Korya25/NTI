import 'package:elwekala/core/cache/cache_helper.dart';
import 'package:elwekala/core/cache/cache_keys.dart';
import 'package:elwekala/core/constants/app_routes.dart';
import 'package:elwekala/features/auth/presentation/screens/login_screen.dart';
import 'package:elwekala/features/cart/presentation/screens/cart_screen.dart';
import 'package:elwekala/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:elwekala/features/home/domain/entities/product.dart';
import 'package:elwekala/features/home/presentation/screens/home_screen.dart';
import 'package:elwekala/features/home/presentation/screens/product_detail_screen.dart';
import 'package:elwekala/features/profile/presentation/screens/profile_screen.dart';
import 'package:elwekala/features/auth/presentation/screens/register_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.profile,
        name: AppRoutes.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.home, 
        builder: (context, state) => const HomeScreen()
      ),
      GoRoute(
        path: AppRoutes.productDetail,
        name: AppRoutes.productDetail,
        builder: (context, state) {
          final product = state.extra as Product;
          return ProductDetailScreen(product: product);
        },
      ),
      GoRoute(
        path: AppRoutes.favorites,
        name: AppRoutes.favorites,
        builder: (context, state) => const FavoritesScreen(),
      ),
      GoRoute(
        path: AppRoutes.cart,
        name: AppRoutes.cart,
        builder: (context, state) => const CartScreen(),
      ),
    ],
    redirect: (context, state) {
      final token = CacheHelper.sharedPreferences.getString(CacheKeys.token);
      final isLoggedIn = token != null;
      final isAuthRoute = _isAuthRoute(state.uri.toString());

      if (!isLoggedIn && !isAuthRoute) {
        return AppRoutes.login;
      }
      
      if (isLoggedIn && isAuthRoute) {
        return AppRoutes.home;
      }

      return null;
    },
  );

  static bool _isAuthRoute(String location) {
    return location == AppRoutes.login || location == AppRoutes.register;
  }
}