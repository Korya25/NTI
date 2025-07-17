import 'package:artify_app/core/resources/app_colors.dart';
import 'package:artify_app/features/home/presentation/widgets/card_header.dart';
import 'package:artify_app/features/home/presentation/widgets/product_componnent.dart';
import 'package:artify_app/features/home/presentation/widgets/product_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String timeLeft;
  final String bid;
  final VoidCallback onBidPressed;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.timeLeft,
    required this.bid,
    required this.onBidPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330.w,
      child: Column(
        children: [
          const CardHeader(),
          Gap(16.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: AppColors.scaffoldBackground,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.r,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                ProductImage(),
                ProductInfo(
                  title: title,
                  timeLeft: timeLeft,
                  bid: bid,
                  onBidPressed: onBidPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
