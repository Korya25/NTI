import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/core/app_colors.dart';
import 'package:recipes_app/core/app_routes.dart';
import 'package:recipes_app/core/app_text_styles.dart';
import 'package:recipes_app/data/datasources/recipe_remote_datasource.dart';
import 'package:recipes_app/data/repo/recipe_repository_impl.dart';
import 'package:recipes_app/domain/usecase/get_recipe_by_id_usecase.dart';
import 'package:recipes_app/presentation/cubit/recipe_detail_cubit.dart';
import 'package:recipes_app/presentation/cubit/recipe_detail_state.dart';

class RecipeDetailScreen extends StatelessWidget {
  final int recipeId;

  const RecipeDetailScreen({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeDetailCubit(
        GetRecipeByIdUseCase(RecipeRepositoryImpl(RecipeRemoteDataSource())),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              context.go(AppRoutes.recipes);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          title: Text('Recipe Details', style: AppTextStyles.heading2),
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
        ),
        body: BlocConsumer<RecipeDetailCubit, RecipeDetailState>(
          listener: (context, state) {
            if (state is RecipeDetailError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is RecipeDetailInitial) {
              context.read<RecipeDetailCubit>().loadRecipe(recipeId);
              return Center(child: CircularProgressIndicator());
            }

            if (state is RecipeDetailLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is RecipeDetailLoaded) {
              final recipe = state.recipe;
              return SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        recipe.image,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 200,
                            color: Colors.grey[300],
                            child: Icon(Icons.image_not_supported, size: 64),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(recipe.name, style: AppTextStyles.heading2),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        SizedBox(width: 4),
                        Text(
                          '${recipe.rating}',
                          style: AppTextStyles.bodyMedium,
                        ),
                        SizedBox(width: 16),
                        Icon(
                          Icons.restaurant,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        SizedBox(width: 4),
                        Text(recipe.cuisine, style: AppTextStyles.bodyMedium),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildInfoCard(
                          'Prep Time',
                          '${recipe.prepTimeMinutes} min',
                        ),
                        _buildInfoCard(
                          'Cook Time',
                          '${recipe.cookTimeMinutes} min',
                        ),
                        _buildInfoCard('Servings', '${recipe.servings}'),
                      ],
                    ),
                    SizedBox(height: 24),
                    Text('Ingredients', style: AppTextStyles.heading3),
                    SizedBox(height: 8),
                    ...recipe.ingredients.map(
                      (ingredient) => Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Row(
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                ingredient,
                                style: AppTextStyles.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text('Instructions', style: AppTextStyles.heading3),
                    SizedBox(height: 8),
                    ...recipe.instructions.asMap().entries.map((entry) {
                      final index = entry.key;
                      final instruction = entry.value;
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: AppColors.onPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                instruction,
                                style: AppTextStyles.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              );
            }

            if (state is RecipeDetailError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, size: 64, color: AppColors.error),
                    SizedBox(height: 16),
                    Text('Error loading recipe', style: AppTextStyles.heading3),
                    SizedBox(height: 8),
                    Text(
                      state.message,
                      style: AppTextStyles.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<RecipeDetailCubit>().loadRecipe(recipeId);
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
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(title, style: AppTextStyles.caption),
        ],
      ),
    );
  }
}
