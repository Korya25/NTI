
// ignore_for_file: deprecated_member_use

import 'package:bmi/core/app_colors.dart' show AppColors;
import 'package:bmi/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final String gender;
  final IconData icon;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderCard({
    super.key,
    required this.gender,
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.1) : AppColors.genderInactive,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? color : AppColors.border,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 48,
              color: isSelected ? color : AppColors.placeholder,
            ),
            SizedBox(height: 8),
            Text(
              gender,
              style: AppTextStyles.bodyLarge.copyWith(
                color: isSelected ? color : AppColors.placeholder,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
