import 'package:artify_app/core/const/app_assets.dart';
import 'package:artify_app/core/const/app_string.dart';
import 'package:artify_app/core/resources/app_colors.dart';
import 'package:artify_app/core/resources/app_text_style.dart';
import 'package:artify_app/features/home/presentation/widgets/bid_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.r),
      child: Image.asset(
        AppImages.object2,
        height: 329.h,
        width: 320.w,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ProductId extends StatelessWidget {
  const ProductId({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '#14415',
        style: AppTextStyle.skipButton.copyWith(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.green,
        ),
      ),
    );
  }
}

class NameAndIcon extends StatelessWidget {
  const NameAndIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Hypebest Apes B',
          style: AppTextStyle.skipButton.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SvgPicture.asset(AppIconSvgs.crown, width: 24.w, height: 24.h),
      ],
    );
  }
}

class SoldAndTimer extends StatelessWidget {
  const SoldAndTimer({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTextStyle.skipButton.copyWith(
      fontSize: 10.sp,
      fontWeight: FontWeight.w300,
      color: AppColors.grey,
    );

    return Row(
      children: [
        Text('125 Sold', style: textStyle),
        Gap(12.w),
        SvgPicture.asset(
          AppIconSvgs.clock,
          width: 14.w,
          height: 14.h,
          colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
        ),
        Gap(6.w),
        Text('1h 23m 32s', style: textStyle),
      ],
    );
  }
}

class DescriptionTitle extends StatelessWidget {
  const DescriptionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        AppString.description,
        style: AppTextStyle.skipButton.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Each Apes NFT is a unique masterpiece, and crafted by artists around the globe.',
      style: AppTextStyle.skipButton.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w100,
        color: AppColors.grey,
      ),
    );
  }
}

class PriceAndBid extends StatelessWidget {
  const PriceAndBid({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.price,
              style: AppTextStyle.skipButton.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.grey,
              ),
            ),
            Text(
              '2.23 ${AppString.eth}',
              style: AppTextStyle.skipButton.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        BidButton(onPressed: () {}),
      ],
    );
  }
}
