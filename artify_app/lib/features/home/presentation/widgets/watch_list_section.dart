
import 'package:artify_app/core/const/app_assets.dart';
import 'package:artify_app/core/resources/app_colors.dart';
import 'package:artify_app/core/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WatchlistSection extends StatelessWidget {
  const WatchlistSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 37.h,
          width: 231.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.r),
            color: AppColors.green,
          ),
          padding: EdgeInsets.only(left: 30.w, top: 7.h),
          child: Text(
            '+  Watchlist',
            style: AppTextStyle.skipButton.copyWith(
              fontSize: 14.sp,
              color: AppColors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SvgPicture.asset(AppIconSvgs.more, height: 24.h, width: 24.w),
      ],
    );
  }
}
