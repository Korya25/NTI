import 'package:artify_app/core/resources/app_colors.dart';
import 'package:artify_app/core/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class NFTCard extends StatelessWidget {
  final String imagePath;
  final String tag;
  final String name;

  const NFTCard({
    super.key,
    required this.imagePath,
    required this.tag,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Image.asset(
            imagePath,
            height: 209.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 25.h,
          left: 10.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tag,
                style: AppTextStyle.skipButton.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.green,
                ),
              ),
              Gap(4.h),
              Text(
                name,
                style: AppTextStyle.skipButton.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
