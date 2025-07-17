import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeSlotCard extends StatelessWidget {
  final String time;
  final bool isSelected;
  final VoidCallback onTap;

  const TimeSlotCard({
    super.key,
    required this.time,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        padding: AppPadding.vertical12,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.primaryColor.withAlpha(50),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Text(
          time,
          style: AppTextStyles.rubik13MediumMainPrimary.copyWith(
            color: isSelected
                ? AppColors.secondaryTextColor
                : AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
