
// ignore_for_file: deprecated_member_use

import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortfolioServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const PortfolioServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final cardHeight = 160.0.h;
    final padding = 16.0.w;

    return Container(
      width: double.infinity,
      height: cardHeight,
      decoration: BoxDecoration(
        color: AppColors.homeSection,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primaryText, width: 1.0.w),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryText.withOpacity(0.1),
            spreadRadius: 2.r,
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          children: [
            // Background gradient
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      AppColors.main.withOpacity(0.7),
                      AppColors.main.withOpacity(0.9),
                    ],
                  ),
                ),
              ),
            ),
            // Content
            Positioned(
              left: padding,
              bottom: padding,
              right: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.roboto22Secondary500.copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    description,
                    style: AppTextStyles.roboto14Secondary400.copyWith(
                      fontSize: 12.sp,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Decorative element
            Positioned(
              top: padding,
              right: padding,
              child: Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.primaryText.withOpacity(0.3),
                      AppColors.primaryText.withOpacity(0.1),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
