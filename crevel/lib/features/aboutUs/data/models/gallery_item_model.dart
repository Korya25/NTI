class GalleryItemModel {
  final String id;
  final String imagePath;
  final double aspectRatio;

  const GalleryItemModel({
    required this.id,
    required this.imagePath,
    this.aspectRatio = 16 / 9,
  });
}