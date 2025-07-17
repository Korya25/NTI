import 'package:doctor_hunt/core/presentation/views/main_view.dart';
import 'package:doctor_hunt/core/resources/app_routes.dart';
import 'package:doctor_hunt/features/auth/presentation/views/login_view.dart';
import 'package:doctor_hunt/features/auth/presentation/views/signup_view.dart';
import 'package:doctor_hunt/features/home/data/models/category_card_model.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/data/models/fake_user_model.dart';
import 'package:doctor_hunt/features/home/presentation/views/doctor_Live_chat_view.dart';
import 'package:doctor_hunt/features/home/presentation/views/featured_doctor_view.dart';
import 'package:doctor_hunt/features/home/presentation/views/find_doctor_view.dart';
import 'package:doctor_hunt/features/home/presentation/views/home_view.dart';
import 'package:doctor_hunt/features/home/presentation/views/popular_doctor_view.dart';
import 'package:doctor_hunt/features/home/presentation/views/select_me_view.dart';
import 'package:doctor_hunt/features/menu/presentation/views/menu_view.dart';
import 'package:doctor_hunt/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final appRouter = GoRouter(
    initialLocation: AppRoutes.onboarding,
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingView(),
      ),
      // sign up & login routes
      GoRoute(
        path: AppRoutes.signupView,
        name: AppRoutes.signupView,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: AppRoutes.loginView,
        name: AppRoutes.loginView,
        builder: (context, state) => const LoginView(),
      ),

      GoRoute(
        path: AppRoutes.doctorLiveChat,
        name: AppRoutes.doctorLiveChat,

        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final doctor = extra['doctor'] as DoctorModel;
          final user = extra['user'] as FakeUser;

          return DoctorLiveChatView(doctorModel: doctor, user: user);
        },
      ),
      GoRoute(
        path: AppRoutes.findDoctor,
        name: AppRoutes.findDoctor,

        builder: (context, state) {
          return FindDoctorView(
            categoryCardModel: state.extra as CategoryCardModel,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.selectMe,
        name: AppRoutes.selectMe,

        builder: (context, state) {
          return SelectMeView(doctor: state.extra as DoctorModel);
        },
      ),
      GoRoute(
        path: AppRoutes.popularDoctors,
        name: AppRoutes.popularDoctors,

        builder: (context, state) {
          return PopularDoctorView();
        },
      ),

      GoRoute(
        path: AppRoutes.featuredDoctors,
        name: AppRoutes.featuredDoctors,

        builder: (context, state) {
          return FeaturedDoctorView();
        },
      ),
      GoRoute(
        path: AppRoutes.menuView,
        name: AppRoutes.menuView,

        builder: (context, state) {
          return MenuView();
        },
      ),
      ShellRoute(
        builder: (context, state, child) =>
            MainShell(location: state.uri.toString(), child: child),
        routes: [
          GoRoute(
            path: AppRoutes.home,
            name: AppRoutes.home,
            builder: (context, state) => const HomeView(),
          ),
          GoRoute(
            path: '/favorites',
            name: 'favorites',
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('favorites'))),
          ),
          GoRoute(
            path: '/book',
            name: 'book',
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('book'))),
          ),
          GoRoute(
            path: '/messages',
            name: 'messages',
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('messages'))),
          ),
        ],
      ),
    ],
  );
}
