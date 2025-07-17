// ignore_for_file: deprecated_member_use

import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:crevel/core/presentation/widgets/animated_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDrawerMenuItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const AppDrawerMenuItemWidget({
    super.key,
    required this.title,
    required this.icon,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: onTap,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.thirdIcon.withAlpha(50)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    _buildIconContainer(),
                    SizedBox(width: 8.w),
                    _buildTitleText(),
                  ],
                ),
              ),
              if (isSelected)
                Positioned(
                  right: 8.w,
                  child: AnimatedStar(size: 20.w),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconContainer() {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.thirdIcon.withOpacity(0.2)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(
        icon,
        size: 18.sp,
        color: isSelected ? AppColors.primaryIcon : AppColors.thirdIcon,
      ),
    );
  }

  Widget _buildTitleText() {
    return Text(
      title,
      style: AppTextStyles.roboto18Secondary500.copyWith(
        color: isSelected
            ? AppColors.thirdIcon
            : AppColors.thirdIcon.withAlpha(200),
        fontWeight: isSelected ? FontWeight.bold : FontWeight.w100,
        fontSize: 16.sp,
      ),
    );
  }
}
