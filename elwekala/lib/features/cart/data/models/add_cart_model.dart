import 'package:elwekala/core/api/end_points.dart';
import 'package:elwekala/features/cart/domain/entities/add_cart_entite.dart';

class AddToCartResponse {
  final String message;
  final AddCartUserModel user;

  const AddToCartResponse({required this.message, required this.user});

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) {
    return AddToCartResponse(
      message: json[ApiKeys.message],
      user: AddCartUserModel.fromJson(json[ApiKeys.user]),
    );
  }
}

class AddCartUserModel extends AddCartUserEntity {
  const AddCartUserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.nationalId,
    required super.profileImage,
    required super.gender,
    required super.password,
    required super.token,
    required super.isAdmin,
    required super.favoriteProducts,
    required super.inCart,
  });
  factory AddCartUserModel.fromJson(Map<String, dynamic> json) {
    return AddCartUserModel(
      id: json[ApiKeys.id],
      name: json[ApiKeys.name],
      email: json[ApiKeys.email],
      phone: json[ApiKeys.phone],
      nationalId: json[ApiKeys.nationalId],
      profileImage: json[ApiKeys.profileImage],
      gender: json[ApiKeys.gender],
      password: json[ApiKeys.password],
      token: json[ApiKeys.token],
      isAdmin: json[ApiKeys.isAdmin],
      favoriteProducts: List<String>.from(json[ApiKeys.favoriteProducts]),
      inCart: (json[ApiKeys.inCart] as List)
          .map((item) => CartItemModel.fromJson(item))
          .toList(),
    );
  }
}

class CartItemModel extends AddCartItemEntity {
  const CartItemModel({
    required super.productId,
    required super.quantity,
    required super.id,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json[ApiKeys.product],
      quantity: json[ApiKeys.quantity],
      id: json[ApiKeys.id],
    );
  }
}
