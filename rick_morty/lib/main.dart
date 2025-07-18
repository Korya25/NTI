import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/core/app_router.dart';
import 'package:rick_morty/data/repositories/character_repo.dart';
import 'package:rick_morty/data/datasources/character_remote_datasource.dart';
import 'package:rick_morty/presentation/cubit/character_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterCubit(
        CharacterRepository(CharacterRemoteDataSource()),
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.grey[100],
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}