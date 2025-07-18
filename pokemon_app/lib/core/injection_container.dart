
import 'package:get_it/get_it.dart';
import 'package:pokemon_app/core/network/dio_client.dart';
import 'package:pokemon_app/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_app/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_app/features/pokemon/presentation/cubit/pokemon_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => DioClient());
  
  // Repository
  sl.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(sl()),
  );
  
  // Cubit
  sl.registerFactory(() => PokemonCubit(sl()));
}
