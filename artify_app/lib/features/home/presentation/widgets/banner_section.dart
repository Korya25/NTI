import 'package:artify_app/core/const/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h, 
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r), 
            child: Image.asset(
              AppImages.banner,
              height: 117.h,
              width: 311.w,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 100.w,
            top: 40.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Image.asset(AppImages.person, height: 102.h, width: 102.w),
            ),
          ),
        ],
      ),
    );
  }
}
