import 'package:artify_app/core/const/app_assets.dart';
import 'package:artify_app/core/const/app_string.dart';
import 'package:artify_app/core/resources/app_colors.dart';
import 'package:artify_app/core/resources/app_text_style.dart';
import 'package:artify_app/features/home/presentation/widgets/bid_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductInfo extends StatelessWidget {
  final String title;
  final String timeLeft;
  final String bid;
  final VoidCallback onBidPressed;

  const ProductInfo({
    super.key,
    required this.title,
    required this.timeLeft,
    required this.bid,
    required this.onBidPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Column(
        children: [
          // Title and Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyle.skipButton.copyWith(fontSize: 16.sp),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    AppString.endIn,
                    style: AppTextStyle.skipButton.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w200,
                      color: AppColors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIconSvgs.clock,
                        width: 14.w,
                        height: 14.h,
                      ),
                      SizedBox(width: 4.w),
                      Text(timeLeft, style: AppTextStyle.skipButton),
                    ],
                  ),
                ],
              ),
            ],
          ),

          Divider(height: 24.h, thickness: 1.w, color: AppColors.grey),

          // Bid Info & Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.highestBidToday,
                    style: AppTextStyle.skipButton.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w100,
                      color: AppColors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppIconSvgs.darkEthereum, width: 8.w),
                      SizedBox(width: 4.w),
                      Text(bid, style: AppTextStyle.skipButton),
                    ],
                  ),
                ],
              ),
              BidButton(onPressed: onBidPressed),
            ],
          ),
        ],
      ),
    );
  }
}
