
import 'package:recipes_app/data/datasources/recipe_remote_datasource.dart';
import 'package:recipes_app/domain/entities/recipe.dart';
import 'package:recipes_app/domain/repositories/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeRemoteDataSource remoteDataSource;

  RecipeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Recipe>> getRecipes() async {
    return await remoteDataSource.getRecipes();
  }

  @override
  Future<Recipe> getRecipeById(int id) async {
    return await remoteDataSource.getRecipeById(id);
  }
}