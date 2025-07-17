class AddCartUserEntity {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String nationalId;
  final String profileImage;
  final String gender;
  final String password;
  final String token;
  final bool isAdmin;
  final List<String> favoriteProducts;
  final List<AddCartItemEntity> inCart;

  const AddCartUserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.nationalId,
    required this.profileImage,
    required this.gender,
    required this.password,
    required this.token,
    required this.isAdmin,
    required this.favoriteProducts,
    required this.inCart,
  });
}

class AddCartItemEntity {
  final String productId;
  final int quantity;
  final String id;

  const AddCartItemEntity({
    required this.productId,
    required this.quantity,
    required this.id,
  });
}
