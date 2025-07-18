
import 'package:rick_morty/data/datasources/character_remote_datasource.dart';
import 'package:rick_morty/data/model/character_model.dart';
import 'package:rick_morty/data/model/character_response.dart';

class CharacterRepository {
  final CharacterRemoteDataSource _remoteDataSource;

  CharacterRepository(this._remoteDataSource);

  Future<CharacterResponse> getCharacters([int page = 1]) async {
    return await _remoteDataSource.getCharacters(page);
  }

  Future<CharacterModel> getCharacterById(int id) async {
    return await _remoteDataSource.getCharacterById(id);
  }
}
