import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateTab extends StatelessWidget {
  final String date;
  final String slotsAvailable;
  final bool isSelected;
  final VoidCallback onTap;

  const DateTab({
    super.key,
    required this.date,
    required this.slotsAvailable,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppPadding.h10v10,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.secondaryColor,
          ),
        ),
        child: Column(
          spacing: 2.h,
          children: [
            Text(
              date,
              style: AppTextStyles.rubik15MediumPrimary.copyWith(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            Text(
              slotsAvailable,
              style: TextStyle(
                color: isSelected ? Colors.white70 : Colors.grey,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
