
import 'package:artify_app/core/const/app_assets.dart';
import 'package:artify_app/core/const/app_string.dart';
import 'package:artify_app/core/resources/app_colors.dart';
import 'package:artify_app/core/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BidButton extends StatelessWidget {
  final VoidCallback onPressed;

  const BidButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 37.h,
        width: 122.w,
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIconSvgs.judge, width: 20.w),
            SizedBox(width: 8.w),
            Text(
              AppString.placeBid,
              style: AppTextStyle.skipButton.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
