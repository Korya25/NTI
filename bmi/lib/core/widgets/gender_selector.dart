import 'package:bmi/core/app_colors.dart';
import 'package:bmi/core/app_text_styles.dart';
import 'package:bmi/core/widgets/GenderCard.dart';
import 'package:flutter/material.dart';


class GenderSelector extends StatelessWidget {
  final String selectedGender;
  final Function(String) onGenderSelected;

  const GenderSelector({
    super.key,
    required this.selectedGender,
    required this.onGenderSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Gender', style: AppTextStyles.heading3),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: GenderCard(
                  gender: 'Male',
                  icon: Icons.male,
                  color: AppColors.maleColor,
                  isSelected: selectedGender == 'Male',
                  onTap: () => onGenderSelected('Male'),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: GenderCard(
                  gender: 'Female',
                  icon: Icons.female,
                  color: AppColors.femaleColor,
                  isSelected: selectedGender == 'Female',
                  onTap: () => onGenderSelected('Female'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}