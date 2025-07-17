import 'package:dartz/dartz.dart';
import 'package:elwekala/core/errors/exceptions.dart';
import 'package:elwekala/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:elwekala/features/cart/domain/entities/add_cart_entite.dart';
import 'package:elwekala/features/cart/domain/entities/delete_cart_item_entitie.dart';
import 'package:elwekala/features/cart/domain/entities/get_cart_product_entity.dart';
import 'package:elwekala/features/cart/domain/entities/update_cart_product_entity.dart';
import 'package:elwekala/features/cart/domain/repos/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepoImpl(this.cartRemoteDataSource);
  @override
  Future<Either<String, AddCartUserEntity>> addCart({
    required String nationalId,
    required String productId,
    required String quantity,
  }) async {
    try {
      final model = await cartRemoteDataSource.addCart(
        nationalId: nationalId,
        productId: productId,
        quantity: quantity,
      );
      return Right(model.user);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  @override
  Future<Either<String, List<DeleteCartItemEntitie>>> deleteCart({
    required String nationalId,
    required String productId,
  }) async {
    try {
      final model = await cartRemoteDataSource.deleteCart(
        nationalId: nationalId,
        productId: productId,
      );
      return Right(model);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  @override
  Future<Either<String, List<GetCartProductEntity>>> getCart({
    required String nationalId,
  }) async {
    try {
      final model = await cartRemoteDataSource.getCart(nationalId: nationalId);
      return Right(model);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  @override
  Future<Either<String, UpdateCartProductEntity>> updateCart({
    required String nationalId,
    required String productId,
    required String quantity,
  }) async {
    try {
      final model = await cartRemoteDataSource.updateCart(
        nationalId: nationalId,
        productId: productId,
        quantity: quantity,
      );
      return Right(model);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
