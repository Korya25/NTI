
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/data/repositories/character_repo.dart';
import 'package:rick_morty/presentation/cubit/character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepository _repository;

  CharacterCubit(this._repository) : super(CharacterInitial());

  Future<void> loadCharacters([int page = 1]) async {
    emit(CharacterLoading());
    try {
      final response = await _repository.getCharacters(page);
      emit(CharacterLoaded(
        characters: response.results,
        currentPage: page,
        totalPages: response.pages,
        hasMore: response.next != null,
      ));
    } catch (e) {
      emit(CharacterError(e.toString()));
    }
  }

  Future<void> loadMoreCharacters() async {
    if (state is CharacterLoaded) {
      final currentState = state as CharacterLoaded;
      if (currentState.hasMore) {
        try {
          final response = await _repository.getCharacters(currentState.currentPage + 1);
          emit(CharacterLoaded(
            characters: [...currentState.characters, ...response.results],
            currentPage: currentState.currentPage + 1,
            totalPages: response.pages,
            hasMore: response.next != null,
          ));
        } catch (e) {
          emit(CharacterError(e.toString()));
        }
      }
    }
  }

  Future<void> loadCharacterById(int id) async {
    emit(CharacterDetailLoading());
    try {
      final character = await _repository.getCharacterById(id);
      emit(CharacterDetailLoaded(character));
    } catch (e) {
      emit(CharacterError(e.toString()));
    }
  }
}
