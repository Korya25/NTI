
import 'package:artify_app/core/resources/app_colors.dart';
import 'package:artify_app/core/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title;
  const CustomButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37.h,
      width: 91.w,
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(40.r),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: AppTextStyle.skipButton.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
        ),
      ),
    );
  }
}
