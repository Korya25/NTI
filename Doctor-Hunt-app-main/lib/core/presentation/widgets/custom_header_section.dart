import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHeaderSection extends StatelessWidget {
  const CustomHeaderSection({
    super.key,
    required this.title,
    this.activeSeeAll,
    this.onSeeAllPressed,
  });

  final String title;
  final bool? activeSeeAll;
  final VoidCallback? onSeeAllPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSeeAllPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.rubik15MediumPrimary),
          Visibility(
            visible: activeSeeAll ?? false,
            child: Row(
              children: [
                Text(
                  AppString.seeAll,
                  style: AppTextStyles.rubik12LightTertiary,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 13.w,
                  color: AppColors.tertiaryTextColor.withAlpha(150),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
