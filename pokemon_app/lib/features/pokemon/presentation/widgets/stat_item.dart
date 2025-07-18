import 'package:flutter/material.dart';
import 'package:pokemon_app/core/constants/app_text_styles.dart';

class StatItem extends StatelessWidget {
  final String label;
  final String value;
  
  const StatItem({
    required this.label,
    required this.value,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: AppTextStyles.body2,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.h3,
        ),
      ],
    );
  }
}