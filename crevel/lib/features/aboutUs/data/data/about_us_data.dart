import 'package:crevel/features/aboutUs/data/models/gallery_item_model.dart';

class AboutUsData {
  static const String aboutUsText = '''
We are a team of passionate individuals dedicated to delivering exceptional services and solutions. Our mission is to empower businesses and individuals through innovative strategies and creative designs. With a focus on quality and customer satisfaction, we strive to exceed expectations in every project we undertake. Join us on a journey towards excellence and creativity.
''';

  static const List<GalleryItemModel> galleryItems = [
    GalleryItemModel(
      id: 'business_cards',
      imagePath: 'assets/images/about_us/business_cards.png',
      aspectRatio: 16 / 9,
    ),
    GalleryItemModel(
      id: 'colorful_shoes',
      imagePath: 'assets/images/about_us/colorful_shoes.png',
      aspectRatio: 16 / 9,
    ),
    GalleryItemModel(
      id: 'white_products',
      imagePath: 'assets/images/about_us/white_products.png',
      aspectRatio: 16 / 9,
    ),
    GalleryItemModel(
      id: 'geometric_planters',
      imagePath: 'assets/images/about_us/geometric_planters.png',
      aspectRatio: 16 / 9,
    ),
  ];
}
