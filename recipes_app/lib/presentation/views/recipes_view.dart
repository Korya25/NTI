
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/core/app_colors.dart';
import 'package:recipes_app/core/app_text_styles.dart';
import 'package:recipes_app/presentation/cubit/recipe_cubit.dart';
import 'package:recipes_app/presentation/cubit/recipe_state.dart';
import 'package:recipes_app/presentation/widgets/recipe_card.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes', style: AppTextStyles.heading2),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
      ),
      body: BlocConsumer<RecipeCubit, RecipeState>(
        listener: (context, state) {
          if (state is RecipeError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is RecipeInitial) {
            context.read<RecipeCubit>().loadRecipes();
            return Center(child: CircularProgressIndicator());
          }
          
          if (state is RecipeLoading) {
            return Center(child: CircularProgressIndicator());
          }
          
          if (state is RecipeLoaded) {
            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: state.recipes.length,
              itemBuilder: (context, index) {
                final recipe = state.recipes[index];
                return RecipeCard(
                  recipe: recipe,
                  onTap: () {
                    context.go('/recipe/${recipe.id}');
                  },
                );
              },
            );
          }
          
          if (state is RecipeError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, size: 64, color: AppColors.error),
                  SizedBox(height: 16),
                  Text(
                    'Error loading recipes',
                    style: AppTextStyles.heading3,
                  ),
                  SizedBox(height: 8),
                  Text(
                    state.message,
                    style: AppTextStyles.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<RecipeCubit>().loadRecipes();
                    },
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          }
          
          return Container();
        },
      ),
    );
  }
}
