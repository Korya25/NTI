import 'package:dio/dio.dart';
import 'package:elwekala/core/api/api_consumer.dart';
import 'package:elwekala/core/api/end_points.dart';
import 'package:elwekala/core/errors/exceptions.dart';
import 'package:elwekala/features/cart/data/models/add_cart_model.dart';
import 'package:elwekala/features/cart/data/models/delet_cart_item_model.dart';
import 'package:elwekala/features/cart/data/models/get_cart_product_model.dart';
import 'package:elwekala/features/cart/data/models/update_cart_product_model.dart';

abstract class CartRemoteDataSource {
  Future<List<GetCartProductModel>> getCart({required String nationalId});
  Future<AddToCartResponse> addCart({
    required String nationalId,
    required String productId,
    required String quantity,
  });

  Future<List<DeletCartItemModel>> deleteCart({
    required String nationalId,
    required String productId,
  });
  Future<UpdateCartProductModel> updateCart({
    required String nationalId,
    required String productId,
    required String quantity,
  });
}

class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  final ApiConsumer apiConsumer;

  CartRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<AddToCartResponse> addCart({
    required String nationalId,
    required String productId,
    required String quantity,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.addCart,
        data: {
          ApiKeys.nationalId: nationalId,
          ApiKeys.productId: productId,
          ApiKeys.quantity: quantity,
        },
      );
      return AddToCartResponse.fromJson(response);
    } on DioException catch (e) {
      handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<List<DeletCartItemModel>> deleteCart({
    required String nationalId,
    required String productId,
  }) async {
    try {
      final response = await apiConsumer.delete(
        EndPoints.deleteCart,
        data: {ApiKeys.nationalId: nationalId, ApiKeys.productId: productId},
      );

      final resualt = (response as List)
          .map((e) => DeletCartItemModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return resualt;
    } on DioException catch (e) {
      handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<List<GetCartProductModel>> getCart({
    required String nationalId,
  }) async {
    try {
      final response = await apiConsumer.get(
        EndPoints.getCart,
        data: {ApiKeys.nationalId: nationalId},
      );
      final List<GetCartProductModel> products =
          (response[ApiKeys.products] as List)
              .map((e) => GetCartProductModel.fromJson(e))
              .toList();
      return products;
    } on DioException catch (e) {
      handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<UpdateCartProductModel> updateCart({
    required String nationalId,
    required String productId,
    required String quantity,
  }) async {
    try {
      final response = await apiConsumer.put(
        EndPoints.updateCart,
        data: {
          ApiKeys.nationalId: nationalId,
          ApiKeys.productId: productId,
          ApiKeys.quantity: quantity,
        },
      );
      final updatedModel = UpdateCartProductModel.fromJson(response);

      return updatedModel;
    } on DioException catch (e) {
      handleDioException(e);
      rethrow;
    }
  }
}
