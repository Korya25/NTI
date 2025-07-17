import 'package:elwekala/core/api/end_points.dart';
import 'package:elwekala/features/home/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json[ApiKeys.id] ?? '',
      status: json[ApiKeys.productStatus] ?? '',
      category: json[ApiKeys.category] ?? '',
      name: json[ApiKeys.name]?.trim() ?? '',
      price: (json[ApiKeys.price] as num).toDouble(),
      description: json[ApiKeys.description] ?? '',
      image: json[ApiKeys.image] ?? '',
      images: List<String>.from(json[ApiKeys.images] ?? []),
      company: json[ApiKeys.company] ?? '',
      countInStock: json[ApiKeys.countInStock] ?? 0,
      sales: json[ApiKeys.sales] ?? 0,
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
    };
  }
}
