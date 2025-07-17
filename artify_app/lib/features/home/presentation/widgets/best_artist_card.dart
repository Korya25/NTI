import 'package:artify_app/core/const/app_assets.dart';
import 'package:artify_app/core/const/app_string.dart';
import 'package:artify_app/core/resources/app_colors.dart';
import 'package:artify_app/core/resources/app_text_style.dart';
import 'package:artify_app/features/home/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BestArtistCard extends StatelessWidget {
  const BestArtistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 320.w,
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppString.bestArtist,
                style: AppTextStyle.skipButton.copyWith(fontSize: 18.sp),
              ),
              SvgPicture.asset(AppIconSvgs.more, height: 24.h, width: 24.w),
            ],
          ),

          Gap(16.h),

          // Artist Info & Follow Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Artist Profile Picture and Info
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(44.r),
                    child: Image.asset(
                      AppImages.person,
                      height: 40.h,
                      width: 40.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Gap(10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Darlene Robertson',
                        style: AppTextStyle.skipButton.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        '125k Followers',
                        style: AppTextStyle.skipButton.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w100,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Follow Button
              CustomButton(title: AppString.follow),
            ],
          ),
        ],
      ),
    );
  }
}
