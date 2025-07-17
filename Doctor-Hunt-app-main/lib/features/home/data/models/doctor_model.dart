class DoctorModel {
  final String id;
  final String name;
  final String category;
  final String image;
  final double price;
  final double rating;
  final int ratingCount;
  final int yearsExperience;
  final int patientStories;
  final String nextAvailable;

  DoctorModel({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    required this.rating,
    required this.ratingCount,
    required this.yearsExperience,
    required this.patientStories,
    required this.nextAvailable,
  });
}
