import 'package:elwekala/core/api/end_points.dart';
import 'package:elwekala/features/cart/domain/entities/delete_cart_item_entitie.dart';

class DeletCartItemModel extends DeleteCartItemEntitie {
  const DeletCartItemModel({
    required super.productId,
    required super.quantity,
    required super.id,
  });

  factory DeletCartItemModel.fromJson(Map<String, dynamic> json) {
    return DeletCartItemModel(
      productId: json[ApiKeys.product],
      quantity: json[ApiKeys.quantity],
      id: json[ApiKeys.id],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.product: productId,
      ApiKeys.quantity: quantity,
      ApiKeys.id: id,
    };
  }
}
