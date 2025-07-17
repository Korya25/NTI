import 'package:elwekala/core/api/end_points.dart';
import 'package:elwekala/features/home/data/models/product_model.dart';
import 'package:elwekala/features/home/domain/entities/product.dart';

class FavoriteProductsResponse {
  final String status;
  final List<Product> favoriteProducts;

  FavoriteProductsResponse({
    required this.status,
    required this.favoriteProducts,
  });

  factory FavoriteProductsResponse.fromJson(Map<String, dynamic> json) {
    return FavoriteProductsResponse(
      status: json[ApiKeys.status],
      favoriteProducts: List<Product>.from(
        json[ApiKeys.favoriteProducts].map((x) => ProductModel.fromJson(x)),
      ),
    );
  }
}
