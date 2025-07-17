import 'package:dartz/dartz.dart';
import 'package:elwekala/features/cart/domain/entities/add_cart_entite.dart';
import 'package:elwekala/features/cart/domain/entities/delete_cart_item_entitie.dart';
import 'package:elwekala/features/cart/domain/entities/get_cart_product_entity.dart';
import 'package:elwekala/features/cart/domain/entities/update_cart_product_entity.dart';
import 'package:elwekala/features/cart/domain/repos/cart_repo.dart';

class CartUseCase {
  final CartRepo cartRepo;

  CartUseCase(this.cartRepo);
  // get
  Future<Either<String, List<GetCartProductEntity>>> getCart({
    required String nationalId,
  }) {
    return cartRepo.getCart(nationalId: nationalId);
  }

  // add
  Future<Either<String, AddCartUserEntity>> addCart({
    required String nationalId,
    required String quantity,
    required String productId,
  }) {
    return cartRepo.addCart(
      nationalId: nationalId,
      productId: productId,
      quantity: quantity,
    );
  }

  // delete
  Future<Either<String, List<DeleteCartItemEntitie>>> deleteCart({
    required String nationalId,
    required String productId,
  }) {
    return cartRepo.deleteCart(nationalId: nationalId, productId: productId);
  }

  // update
  Future<Either<String, UpdateCartProductEntity>> updateCart({
    required String nationalId,
    required String quantity,
    required String productId,
  }) {
    return cartRepo.updateCart(
      nationalId: nationalId,
      productId: productId,
      quantity: quantity,
    );
  }
}
