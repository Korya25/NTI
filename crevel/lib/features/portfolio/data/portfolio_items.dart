import 'package:crevel/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> portfolioItems = [
  {
    'title': 'Mobile App Design',
    'description':
        'Complete UI/UX design for a modern fintech mobile application with intuitive user flows and beautiful animations.',
    'category': 'UI/UX Design',
    'icon': Icons.phone_android,
    'color': AppColors.primaryText,
  },
  {
    'title': 'E-commerce Platform',
    'description':
        'Full-stack development of a responsive e-commerce platform with advanced filtering and payment integration.',
    'category': 'Web Development',
    'icon': Icons.shopping_cart,
    'color': const Color(0xFF4CAF50),
  },
  {
    'title': 'Brand Identity',
    'description':
        'Complete brand identity design including logo, color palette, typography, and brand guidelines for a startup.',
    'category': 'Branding',
    'icon': Icons.palette,
    'color': const Color(0xFFFF6B6B),
  },
  {
    'title': 'Social Media Campaign',
    'description':
        'Creative social media campaign design with engaging posts, stories, and interactive content for brand awareness.',
    'category': 'Social Media',
    'icon': Icons.share,
    'color': const Color(0xFF9C27B0),
  },
];
