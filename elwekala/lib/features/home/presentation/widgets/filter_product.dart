class ProductFilterOptions {
  final String? status;
  final String? name;
  final double? maxPrice;
  final double? minPrice;

  ProductFilterOptions({
     this.status,
     this.name,
     this.maxPrice,
     this.minPrice,
  });

  ProductFilterOptions copyWith({
    final String? status,
    final String? category,
    final String? name,
    final double? maxPrice,
    final double? minPrice,
    final String? company,
  }) {
    return ProductFilterOptions(
      status: status ?? this.status,
      name: name ?? this.name,
      maxPrice: maxPrice ?? this.maxPrice,
      minPrice: minPrice ?? this.minPrice,
    );
  }
}
