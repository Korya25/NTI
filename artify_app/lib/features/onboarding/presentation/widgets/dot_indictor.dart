import 'package:artify_app/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotIndictor extends StatelessWidget {
  const DotIndictor({
    super.key,
    required this.pageController,
    required this.count,
  });
  final PageController pageController;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: count,
      axisDirection: Axis.horizontal,
      effect: CustomizableEffect(
        activeDotDecoration: DotDecoration(
          height: 10.h,
          width: 10.w,
          color: AppColors.black,
          borderRadius: BorderRadius.circular(20.r),
        ),
        dotDecoration: DotDecoration(
          height: 6.h,
          width: 6.w,
          color: AppColors.black.withAlpha(120),
          borderRadius: BorderRadius.circular(50.r),
        ),
        spacing: 6,
      ),
    );
  }
}
