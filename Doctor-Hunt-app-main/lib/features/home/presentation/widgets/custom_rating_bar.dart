import 'package:doctor_hunt/core/constant/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemCount: 5,
      itemSize: 13.sp,
      itemPadding: EdgeInsets.symmetric(horizontal: 2.5.w),
      itemBuilder: (context, _) =>
          SvgPicture.asset(AppIconsSvgs.star, width: 13.sp, height: 13.sp),
    );
  }
}
