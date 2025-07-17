import 'package:elwekala/features/cart/domain/entities/add_cart_entite.dart';
import 'package:elwekala/features/cart/domain/entities/delete_cart_item_entitie.dart';
import 'package:elwekala/features/cart/domain/entities/get_cart_product_entity.dart';
import 'package:elwekala/features/cart/domain/entities/update_cart_product_entity.dart';

abstract class CartState {
  const CartState();
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartGetSuccess extends CartState {
  final List<GetCartProductEntity> products;

  const CartGetSuccess(this.products);
}

class CartAddSuccess extends CartState {
  final AddCartUserEntity user;

  const CartAddSuccess(this.user);
}

class CartDeleteSuccess extends CartState {
  final List<DeleteCartItemEntitie> updatedItems;

  const CartDeleteSuccess(this.updatedItems);
}

class CartUpdateSuccess extends CartState {
  final UpdateCartProductEntity updatedProduct;

  const CartUpdateSuccess(this.updatedProduct);
}

class CartFailure extends CartState {
  final String error;

  const CartFailure(this.error);
}
