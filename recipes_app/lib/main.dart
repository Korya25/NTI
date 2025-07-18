import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/data/repo/recipe_repository_impl.dart';
import 'package:recipes_app/domain/usecase/get_recipes_usecase.dart';
import 'package:recipes_app/presentation/cubit/recipe_cubit.dart';
import 'core/app_colors.dart';
import 'core/app_routes.dart';
import 'data/datasources/recipe_remote_datasource.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RecipeCubit(
            GetRecipesUseCase(RecipeRepositoryImpl(RecipeRemoteDataSource())),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColors.background,
        ),
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
