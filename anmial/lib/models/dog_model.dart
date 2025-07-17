class DogModel   {
  final String imageUrl;
  final String status;

  const DogModel({
    required this.imageUrl,
    required this.status,
  });

  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(
      imageUrl: json['message'] ?? '',
      status: json['status'] ?? '',
    );
  }

}
