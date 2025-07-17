class ServiceModel {
  final String id;
  final String title;
  final String description;
  final String iconName;
  final bool isActive;

  const ServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.iconName,
    this.isActive = true,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      iconName: json['iconName'] as String,
      isActive: json['isActive'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'iconName': iconName,
      'isActive': isActive,
    };
  }
}
