import 'package:dio/dio.dart';
import 'package:pokemon_app/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_app/features/pokemon/pokemon_model.dart';
import '../../../../core/error/failures.dart';

import '../../../../core/network/dio_client.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final DioClient dioClient;

  PokemonRepositoryImpl(this.dioClient);

  @override
  Future<Either<Failure, List<PokemonListModel>>> getPokemonList({
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      final response = await dioClient.dio.get(
        'pokemon',
        queryParameters: {'limit': limit, 'offset': offset},
      );
      
      final List<PokemonListModel> pokemonList = (response.data['results'] as List)
          .map((json) => PokemonListModel.fromJson(json))
          .toList();
      
      return Right(pokemonList);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        return const Left(NetworkFailure());
      }
      return Left(ServerFailure(e.message ?? 'Server error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PokemonModel>> getPokemonDetail(String id) async {
    try {
      final response = await dioClient.dio.get('pokemon/$id');
      final pokemon = PokemonModel.fromJson(response.data);
      return Right(pokemon);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        return const Left(NetworkFailure());
      }
      return Left(ServerFailure(e.message ?? 'Server error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

// Helper class for Either
abstract class Either<L, R> {
  const Either();
  
  bool get isLeft => this is Left<L, R>;
  bool get isRight => this is Right<L, R>;
  
  L get left => (this as Left<L, R>).value;
  R get right => (this as Right<L, R>).value;
}

class Left<L, R> extends Either<L, R> {
  final L value;
  const Left(this.value);
}

class Right<L, R> extends Either<L, R> {
  final R value;
  const Right(this.value);
}