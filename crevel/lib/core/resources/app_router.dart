import 'package:crevel/core/presentation/views/main_view.dart';
import 'package:crevel/features/aboutUs/presentation/views/about_us_view.dart';
import 'package:crevel/features/blog/presentation/views/blog_view.dart';
import 'package:crevel/features/contact/presentation/views/contact_view.dart';
import 'package:crevel/features/portfolio/presentation/views/portfolio_view.dart';
import 'package:crevel/features/services/presentation/views/services_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:crevel/core/resources/app_routes.dart';
import 'package:crevel/features/splash/presentation/views/splash_view.dart';
import 'package:crevel/features/home/presentation/views/home_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        builder: (context, state) => const SplashView(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.home,
            name: AppRoutes.home,
            builder: (context, state) => const HomeView(),
          ),
          GoRoute(
            path: AppRoutes.services,
            name: AppRoutes.services,
            builder: (context, state) =>
                const ServicesView(),
          ),
          GoRoute(
            path: AppRoutes.portfolio,
            name: AppRoutes.portfolio,
            builder: (context, state) => const PortfolioView(),
          ),
          GoRoute(
            path: AppRoutes.about,
            name: AppRoutes.about,
            builder: (context, state) =>
                const AboutUsView(),
          ),
          GoRoute(
            path: AppRoutes.news,
            name: AppRoutes.news,
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('news'))),
          ),
          GoRoute(
            path: AppRoutes.contact,
            name: AppRoutes.contact,
            builder: (context, state) => const ContactView(),
          ),
          GoRoute(
            path: AppRoutes.blog,
            name: AppRoutes.blog,
            builder: (context, state) => BlogView(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text("Something went wrong..."))),
  );
}
