import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/core/error/failures.dart';
import 'package:pokemon_app/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_app/features/pokemon/presentation/cubit/pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final PokemonRepository repository;

  PokemonCubit(this.repository) : super(PokemonInitial());

  Future<void> loadPokemonList({int limit = 20, int offset = 0}) async {
    emit(PokemonLoading());

    final result = await repository.getPokemonList(
      limit: limit,
      offset: offset,
    );

    result.isLeft
        ? emit(PokemonError(_mapFailureToMessage(result.left)))
        : emit(PokemonListLoaded(result.right));
  }

  Future<void> loadPokemonDetail(String id) async {
    emit(PokemonLoading());

    final result = await repository.getPokemonDetail(id);

    result.isLeft
        ? emit(PokemonError(_mapFailureToMessage(result.left)))
        : emit(PokemonDetailLoaded(result.right));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return (failure as ServerFailure).message;
      case NetworkFailure _:
        return 'Network connection failed';
      default:
        return 'Unexpected error';
    }
  }
}
