import 'package:go_router/go_router.dart';
import 'package:recipes_app/presentation/views/recipe_detail_screen.dart';
import 'package:recipes_app/presentation/views/recipes_view.dart';


class AppRoutes {
  static const String recipes = '/';
  static const String recipeDetail = '/recipe/:id';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: recipes,
        builder: (context, state) => RecipesScreen(),
      ),
      GoRoute(
        path: recipeDetail,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return RecipeDetailScreen(recipeId: int.parse(id));
        },
      ),
    ],
  );
}