class UserEntity {
  final String name;
  final String email;
  final String phone;
  final String nationalId;
  final String gender;
  final String profileImage;
  final String token;

  const UserEntity({
    required this.name,
    required this.email,
    required this.phone,
    required this.nationalId,
    required this.gender,
    required this.profileImage,
    required this.token,
  });
}
