import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/presentation/widgets/blurred_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingBackground extends StatelessWidget {
  const OnboardingBackground({
    super.key,
    required this.child,
    required this.isTopContainerLeft,
  });

  final Widget child;
  final bool isTopContainerLeft;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Bottom
        Align(
          alignment: const Alignment(1.2, 1.2),
          child: CustomBlurredCircle(
            color: AppColors.bottomBackgroundContainer,
          ),
        ),

        /// Top
        AnimatedAlign(
          alignment: Alignment(isTopContainerLeft ? -17.0 : 17.0, -1.5),
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          child: Container(
            height: 362.h,
            width: 362.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
