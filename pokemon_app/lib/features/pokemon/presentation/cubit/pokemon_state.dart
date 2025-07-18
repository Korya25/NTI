import 'package:pokemon_app/features/pokemon/pokemon_model.dart';

abstract class PokemonState   {
  const PokemonState();
}

class PokemonInitial extends PokemonState {

}

class PokemonLoading extends PokemonState {

}

class PokemonListLoaded extends PokemonState {
  final List<PokemonListModel> pokemonList;
  
  const PokemonListLoaded(this.pokemonList);
  

}

class PokemonDetailLoaded extends PokemonState {
  final PokemonModel pokemon;
  
  const PokemonDetailLoaded(this.pokemon);
  

}

class PokemonError extends PokemonState {
  final String message;
  
  const PokemonError(this.message);

}
