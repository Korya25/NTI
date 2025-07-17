
import 'package:anmial/enum/enums.dart';
import 'package:anmial/models/dog_model.dart';
import 'package:dio/dio.dart';

class PetRepository {
  final Dio _dio;

  PetRepository(this._dio);

  Future<String> fetchRandomPetImage(PetType petType) async {
    try {
      switch (petType) {
        case PetType.dog:
          final response = await _dio.get('https://dog.ceo/api/breeds/image/random');
          final dogModel = DogModel.fromJson(response.data);
          return dogModel.imageUrl;
        
        case PetType.catImage:
          return 'https://cataas.com/cat';
        
        case PetType.catGif:
          return 'https://cataas.com/cat/gif';
      }
    } catch (e) {
      throw Exception('Failed to fetch pet image: $e');
    }
  }
}

