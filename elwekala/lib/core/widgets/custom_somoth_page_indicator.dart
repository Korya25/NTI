
import 'package:elwekala/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSomothPageIndicator extends StatelessWidget {
  const CustomSomothPageIndicator({
    super.key,
    required int currentIndex,
    required this.length,
  }) : _currentIndex = currentIndex;

  final int _currentIndex;
  final int length;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: PageController(
        initialPage: _currentIndex,
        viewportFraction: 1.0,
      ),
      count: length,

      effect: ScrollingDotsEffect(
        activeDotColor: AppColors.activeIconColor,
        dotColor: AppColors.iconColor,
        dotWidth: 8.w,
        dotHeight: 8.h,
        spacing: 5.w,
        radius: 100.r,
      ),
    );
  }
}
