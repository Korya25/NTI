import 'package:go_router/go_router.dart';
import 'package:pokemon_app/features/pokemon/presentation/views/pokemon_detail_view.dart';
import 'package:pokemon_app/features/pokemon/presentation/views/pokemon_list_view.dart';
import 'package:pokemon_app/features/splash/presentation/views/splash_page.dart';


class AppRoutes {
  static const String splash = '/';
  static const String pokemonList = '/pokemon-list';
  static const String pokemonDetail = '/pokemon/:id';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: pokemonList,
        builder: (context, state) => const PokemonListPage(),
      ),
      GoRoute(
        path: pokemonDetail,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return PokemonDetailPage(pokemonId: id);
        },
      ),
    ],
  );
}