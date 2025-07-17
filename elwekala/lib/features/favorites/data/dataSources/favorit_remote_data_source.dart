import 'package:dio/dio.dart';
import 'package:elwekala/core/api/api_consumer.dart';
import 'package:elwekala/core/api/end_points.dart';
import 'package:elwekala/core/errors/exceptions.dart';
import 'package:elwekala/features/favorites/data/models/favorite_action_response.dart';
import 'package:elwekala/features/favorites/data/models/get_favorite_model.dart';
import 'package:elwekala/features/home/domain/entities/product.dart';

abstract class FavoriteRemoteDataSource {
  Future<List<Product>> getFavorite({required String nationalId});
  Future<FavoriteActionResponse> addFavoriteAction({
    required String nationalId,
    required String productId,
  });
  Future<FavoriteActionResponse> deleteFavoriteAction({
    required String nationalId,
    required String productId,
  });
}

class FavoriteRemoteDataSourceImpl extends FavoriteRemoteDataSource {
  final ApiConsumer apiConsumer;

  FavoriteRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<List<Product>> getFavorite({required String nationalId}) async {
    try {
      final response = await apiConsumer.get(
        EndPoints.favorite,
        data: {ApiKeys.nationalId: nationalId},
      );

      return FavoriteProductsResponse.fromJson(response).favoriteProducts;
    } on DioException catch (e) {
      handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<FavoriteActionResponse> addFavoriteAction({
    required String nationalId,
    required String productId,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.favorite,

        data: {ApiKeys.nationalId: nationalId, ApiKeys.productId: productId},
      );

      return FavoriteActionResponse.fromJson(response);
    } on DioException catch (e) {
      handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<FavoriteActionResponse> deleteFavoriteAction({
    required String nationalId,
    required String productId,
  }) async {
    try {
      final response = await apiConsumer.delete(
        EndPoints.favorite,
        data: {ApiKeys.nationalId: nationalId, ApiKeys.productId: productId},
      );

      return FavoriteActionResponse.fromJson(response);
    } on DioException catch (e) {
      handleDioException(e);
      rethrow;
    }
  }
}
