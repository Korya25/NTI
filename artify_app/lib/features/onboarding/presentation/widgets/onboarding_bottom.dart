
import 'package:artify_app/core/const/app_assets.dart';
import 'package:artify_app/core/resources/app_colors.dart';
import 'package:artify_app/features/onboarding/presentation/widgets/dot_indictor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingBottom extends StatelessWidget {
  final PageController pageController;
  final int count;
  final VoidCallback onNext;

  const OnboardingBottom({
    super.key,
    required this.pageController,
    required this.count,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // indddictor
          DotIndictor(pageController: pageController, count: count),

          // forward arrow button
          GestureDetector(
            onTap: onNext,
            child: Container(
              height: 56.h,
              width: 56.w,
              decoration: BoxDecoration(
                color: AppColors.black,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(16),
              child: SvgPicture.asset(
                AppIconSvgs.forwardIcon,
                height: 24.h,
                width: 24.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
