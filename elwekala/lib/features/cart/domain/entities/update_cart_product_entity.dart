class UpdateCartProductEntity {
  final UpdateProductEntity product;
  final int quantity;
  final num totalPrice;

  const UpdateCartProductEntity({
    required this.product,
    required this.quantity,
    required this.totalPrice,
  });
}

class UpdateProductEntity {
  final String id;
  final String status;
  final String category;
  final String name;
  final num price;
  final String description;
  final String image;
  final List<String> images;
  final String company;
  final int countInStock;
  final int sales;

  const UpdateProductEntity({
    required this.id,
    required this.status,
    required this.category,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.images,
    required this.company,
    required this.countInStock,
    required this.sales,
  });
}
