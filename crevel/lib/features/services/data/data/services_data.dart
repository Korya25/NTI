
import 'package:crevel/features/services/data/models/service_model.dart';
import 'package:flutter/material.dart';

class ServicesData {
  static const List<ServiceModel> services = [
    ServiceModel(
      id: 'social_media',
      title: 'SOCIAL MEDIA',
      description:
          'Build your brand and engage your audience with content & analytics.',
      iconName: 'trending_up',
    ),
    ServiceModel(
      id: 'digital_marketing',
      title: 'DIGITAL MARKETING',
      description: 'Campaigns that convert: paid ads, SEO, email, and more.',
      iconName: 'campaign',
    ),
    ServiceModel(
      id: 'branding_design',
      title: 'BRANDING & DESIGN',
      description: 'Logos, brand identity, and creative visuals to stand out.',
      iconName: 'brush',
    ),
    ServiceModel(
      id: 'app_development',
      title: 'APP DEVELOPMENT',
      description: 'Android & iOS apps built for performance and usability.',
      iconName: 'phone_android',
    ),
    ServiceModel(
      id: 'seo_analytics',
      title: 'SEO & ANALYTICS',
      description: 'Rank higher on Google and analyze your digital success.',
      iconName: 'analytics',
    ),
  ];

  static IconData getIconData(String iconName) {
    switch (iconName) {
      case 'trending_up':
        return Icons.trending_up;
      case 'campaign':
        return Icons.campaign;
      case 'brush':
        return Icons.brush;
      case 'phone_android':
        return Icons.phone_android;
      case 'analytics':
        return Icons.analytics;
      default:
        return Icons.help;
    }
  }
}
