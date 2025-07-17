import 'package:elwekala/core/api/end_points.dart';
import 'package:elwekala/features/cart/domain/entities/get_cart_product_entity.dart';

class GetCartProductModel extends GetCartProductEntity {
  const GetCartProductModel({
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
    required super.quantity,
    required super.totalPrice,
  });

  factory GetCartProductModel.fromJson(Map<String, dynamic> json) {
    return GetCartProductModel(
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
      quantity: json[ApiKeys.quantity],
      totalPrice: json[ApiKeys.totalPrice],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.id: id,
      ApiKeys.productStatus: status,
      ApiKeys.category: category,
      ApiKeys.name: name,
      ApiKeys.price: price,
      ApiKeys.description: description,
      ApiKeys.image: image,
      ApiKeys.images: images,
      ApiKeys.company: company,
      ApiKeys.countInStock: countInStock,
      ApiKeys.sales: sales,
      ApiKeys.quantity: quantity,
      ApiKeys.totalPrice: totalPrice,
    };
  }
}
