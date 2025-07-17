import 'package:elwekala/core/api/end_points.dart';
import 'package:elwekala/features/cart/domain/entities/update_cart_product_entity.dart';

class UpdateCartProductModel extends UpdateCartProductEntity {
  const UpdateCartProductModel({
    required super.product,
    required super.quantity,
    required super.totalPrice,
  });

  factory UpdateCartProductModel.fromJson(Map<String, dynamic> json) {
    return UpdateCartProductModel(
      product: UpdateProductModel.fromJson(json[ApiKeys.product]),
      quantity: json[ApiKeys.quantity] ?? 0,
      totalPrice: json[ApiKeys.totalPrice] ?? 0,
    );
  }
}

class UpdateProductModel extends UpdateProductEntity {
  const UpdateProductModel({
    required super.id,
    required super.status,
    required super.category,
    required super.name,
    required super.price,
    required super.description,
    required super.image,
    required super.images,
    required super.company,
    required super.countInStock,
    required super.sales,
  });

  factory UpdateProductModel.fromJson(Map<String, dynamic> json) {
    return UpdateProductModel(
      id: json[ApiKeys.id],
      status: json[ApiKeys.productStatus],
      category: json[ApiKeys.category],
      name: json[ApiKeys.name],
      price: json[ApiKeys.price],
      description: json[ApiKeys.description],
      image: json[ApiKeys.image],
      images: List<String>.from(json[ApiKeys.images]),
      company: json[ApiKeys.company],
      countInStock: json[ApiKeys.countInStock],
      sales: json[ApiKeys.sales],
    );
  }
}
