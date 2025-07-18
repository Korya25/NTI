import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_morty/core/app_routes.dart';
import 'package:rick_morty/presentation/views/character_detail.dart';
import 'package:rick_morty/presentation/views/character_list_page.dart';
import 'package:rick_morty/data/model/character_model.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.characterList,
    routes: [
      GoRoute(
        path: AppRoutes.characterList,
        name: AppRoutes.characterList,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const CharacterListPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.characterDetail,
        name: AppRoutes.characterDetail,
        pageBuilder: (context, state) {
          final character = state.extra as CharacterModel;
          return MaterialPage(
            key: state.pageKey,
            child: CharacterDetailPage(character: character),
          );
        },
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text('Error: ${state.error}'),
        ),
      ),
    ),
  );
}