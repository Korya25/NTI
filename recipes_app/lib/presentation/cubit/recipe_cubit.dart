
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/domain/usecase/get_recipes_usecase.dart';
import 'package:recipes_app/presentation/cubit/recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  final GetRecipesUseCase getRecipesUseCase;

  RecipeCubit(this.getRecipesUseCase) : super(RecipeInitial());

  void loadRecipes() async {
    emit(RecipeLoading());
    try {
      final recipes = await getRecipesUseCase();
      emit(RecipeLoaded(recipes));
    } catch (e) {
      emit(RecipeError(e.toString()));
    }
  }
}
