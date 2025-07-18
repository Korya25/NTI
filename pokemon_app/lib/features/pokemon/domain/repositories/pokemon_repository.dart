

import 'package:pokemon_app/core/error/failures.dart';
import 'package:pokemon_app/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_app/features/pokemon/pokemon_model.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<PokemonListModel>>> getPokemonList({
    int limit = 20,
    int offset = 0,
  });
  
  Future<Either<Failure, PokemonModel>> getPokemonDetail(String id);
}