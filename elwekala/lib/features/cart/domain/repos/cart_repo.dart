import 'package:dartz/dartz.dart';
import 'package:elwekala/features/cart/domain/entities/add_cart_entite.dart';
import 'package:elwekala/features/cart/domain/entities/delete_cart_item_entitie.dart';
import 'package:elwekala/features/cart/domain/entities/get_cart_product_entity.dart';
import 'package:elwekala/features/cart/domain/entities/update_cart_product_entity.dart';

abstract class CartRepo {
  Future<Either<String, List<GetCartProductEntity>>> getCart({
    required String nationalId,
  });
  Future<Either<String, AddCartUserEntity>> addCart({
    required String nationalId,
    required String productId,
    required String quantity,
  });
  Future<Either<String, List<DeleteCartItemEntitie>>> deleteCart({
    required String nationalId,
    required String productId,
  });
  Future<Either<String, UpdateCartProductEntity>> updateCart({
    required String nationalId,
    required String productId,
    required String quantity,
  });
}
