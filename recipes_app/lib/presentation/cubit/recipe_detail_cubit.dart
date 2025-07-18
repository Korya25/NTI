import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/domain/usecase/get_recipe_by_id_usecase.dart';
import 'package:recipes_app/presentation/cubit/recipe_detail_state.dart';

class RecipeDetailCubit extends Cubit<RecipeDetailState> {
  final GetRecipeByIdUseCase getRecipeByIdUseCase;

  RecipeDetailCubit(this.getRecipeByIdUseCase) : super(RecipeDetailInitial());

  void loadRecipe(int id) async {
    emit(RecipeDetailLoading());
    try {
      final recipe = await getRecipeByIdUseCase(id);
      emit(RecipeDetailLoaded(recipe));
    } catch (e) {
      emit(RecipeDetailError(e.toString()));
    }
  }
}