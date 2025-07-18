import 'package:dio/dio.dart';
import 'package:rick_morty/data/model/character_model.dart';
import 'package:rick_morty/data/model/character_response.dart';


class CharacterRemoteDataSource {
  final Dio _dio = Dio();
  final String baseUrl = 'https://rickandmortyapi.com/api';

  Future<CharacterResponse> getCharacters([int page = 1]) async {
    try {
      final response = await _dio.get('$baseUrl/character?page=$page');
      return CharacterResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load characters: $e');
    }
  }

  Future<CharacterModel> getCharacterById(int id) async {
    try {
      final response = await _dio.get('$baseUrl/character/$id');
      return CharacterModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load character: $e');
    }
  }
}