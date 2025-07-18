import 'package:recipes_app/domain/entities/recipe.dart';

abstract class RecipeDetailState {}

class RecipeDetailInitial extends RecipeDetailState {}

class RecipeDetailLoading extends RecipeDetailState {}

class RecipeDetailLoaded extends RecipeDetailState {
  final Recipe recipe;
  RecipeDetailLoaded(this.recipe);
}

class RecipeDetailError extends RecipeDetailState {
  final String message;
  RecipeDetailError(this.message);
}