
import 'package:dio/dio.dart';
import 'package:recipes_app/data/models/recipe_model.dart';

class RecipeRemoteDataSource {
  final Dio _dio = Dio();
  static const String baseUrl = 'https://dummyjson.com';

  Future<List<RecipeModel>> getRecipes() async {
    try {
      final response = await _dio.get('$baseUrl/recipes');
      final List<dynamic> recipesJson = response.data['recipes'];
      return recipesJson.map((json) => RecipeModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load recipes');
    }
  }

  Future<RecipeModel> getRecipeById(int id) async {
    try {
      final response = await _dio.get('$baseUrl/recipes/$id');
      return RecipeModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load recipe');
    }
  }
}
