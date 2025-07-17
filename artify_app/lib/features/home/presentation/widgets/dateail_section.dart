
import 'package:artify_app/core/const/app_assets.dart';
import 'package:artify_app/core/resources/app_colors.dart';
import 'package:artify_app/core/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Darlene Roberston',
              style: AppTextStyle.skipButton.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset(AppIconSvgs.varfiyIcon, width: 14.w, height: 14.h),
          ],
        ),
        Gap(8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            'Each Apes NFT is a unique masterpiece, and crafted by artists around the globe.',
            textAlign: TextAlign.center,
            style: AppTextStyle.skipButton.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
              color: AppColors.grey,
            ),
          ),
        ),
        Gap(16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const StatColumn(value: '10.0K', label: 'Items'),
            SizedBox(
              height: 33.h,
              child: VerticalDivider(color: AppColors.black),
            ),
            const StatColumnWithIcon(value: '689.10K', label: 'Volume'),
            SizedBox(
              height: 33.h,
              child: VerticalDivider(color: AppColors.black),
            ),
            const StatColumnWithIcon(value: '13.99', label: 'Floor Price'),
          ],
        ),
      ],
    );
  }
}

class StatColumn extends StatelessWidget {
  final String value;
  final String label;

  const StatColumn({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyle.skipButton.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: AppTextStyle.skipButton.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w300,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}

class StatColumnWithIcon extends StatelessWidget {
  final String value;
  final String label;

  const StatColumnWithIcon({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppIconSvgs.darkEthereum,
              height: 14.h,
              width: 8.w,
            ),
            SizedBox(width: 5.w),
            Text(
              value,
              style: AppTextStyle.skipButton.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: AppTextStyle.skipButton.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w300,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
