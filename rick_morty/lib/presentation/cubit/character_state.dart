
import 'package:rick_morty/data/model/character_model.dart';

abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<CharacterModel> characters;
  final int currentPage;
  final int totalPages;
  final bool hasMore;

  CharacterLoaded({
    required this.characters,
    required this.currentPage,
    required this.totalPages,
    required this.hasMore,
  });
}

class CharacterDetailLoading extends CharacterState {}

class CharacterDetailLoaded extends CharacterState {
  final CharacterModel character;

  CharacterDetailLoaded(this.character);
}

class CharacterError extends CharacterState {
  final String message;

  CharacterError(this.message);
}