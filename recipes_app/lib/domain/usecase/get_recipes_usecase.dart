import 'package:recipes_app/domain/entities/recipe.dart';
import 'package:recipes_app/domain/repositories/recipe_repository.dart';

class GetRecipesUseCase {
  final RecipeRepository repository;

  GetRecipesUseCase(this.repository);

  Future<List<Recipe>> call() async {
    return await repository.getRecipes();
  }
}