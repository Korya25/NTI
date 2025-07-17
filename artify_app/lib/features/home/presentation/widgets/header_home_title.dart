
import 'package:artify_app/core/const/app_string.dart';
import 'package:artify_app/core/resources/app_colors.dart';
import 'package:artify_app/core/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderHomeTitle extends StatelessWidget {
  const HeaderHomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        style: AppTextStyle.onboardingTitle.copyWith(fontSize: 24.sp),
        children: [
          TextSpan(text: AppString.homeTitle1),
          TextSpan(text: ' '),
          TextSpan(
            text: AppString.homeTitle2,
            style: AppTextStyle.onboardingTitle.copyWith(
              color: AppColors.green,
              fontSize: 24.sp,
            ),
          ),
          TextSpan(text: ' '),

          TextSpan(text: AppString.homeTitle3),
        ],
      ),
    );
  }
}
