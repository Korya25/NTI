class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String city;
  final String country;
  final String imageUrl;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.city,
    required this.country,
    required this.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['name']['first'],
      lastName: json['name']['last'],
      email: json['email'],
      city: json['location']['city'],
      country: json['location']['country'],
      imageUrl: json['picture']['large'],
    );
  }

}
