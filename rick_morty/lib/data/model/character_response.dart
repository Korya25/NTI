import 'package:rick_morty/data/model/character_model.dart';

class CharacterResponse {
  final List<CharacterModel> results;
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  CharacterResponse({
    required this.results,
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory CharacterResponse.fromJson(Map<String, dynamic> json) {
    return CharacterResponse(
      results: (json['results'] as List)
          .map((character) => CharacterModel.fromJson(character))
          .toList(),
      count: json['info']['count'],
      pages: json['info']['pages'],
      next: json['info']['next'],
      prev: json['info']['prev'],
    );
  }
}