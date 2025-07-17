import 'package:elwekala/core/constants/app_colors.dart';
import 'package:elwekala/core/widgets/custom_button.dart';
import 'package:elwekala/features/home/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class InfoDetailScreen extends StatelessWidget {
  const InfoDetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TitleAndPrice(product: product),
        SizedBox(height: 8.h),
        _CompanyAndStatus(product: product),
        SizedBox(height: 16.h),
        _RatingAndStock(product: product),
        SizedBox(height: 24.h),
        _DescriptionSection(product: product),
        SizedBox(height: 24.h),
        CustomButton(text: 'Add to Cart', onPressed: () {}),
      ],
    );
  }
}

class _TitleAndPrice extends StatelessWidget {
  final Product product;

  const _TitleAndPrice({required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            product.name,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}

class _CompanyAndStatus extends StatelessWidget {
  final Product product;

  const _CompanyAndStatus({required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          product.company,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.secondaryTextColor,
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: product.status == 'New'
                ? AppColors.successColor
                : Colors.orange,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Text(
            product.status,
            style: TextStyle(color: Colors.white, fontSize: 12.sp),
          ),
        ),
      ],
    );
  }
}

class _RatingAndStock extends StatelessWidget {
  final Product product;

  const _RatingAndStock({required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(5, (index) {
            return Icon(
              index < 0.floor() ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 20.sp,
            );
          }),
        ),
        SizedBox(width: 8.w),
        Text(
          '${0.toStringAsFixed(1)} (${0} reviews)',
          style: TextStyle(fontSize: 14.sp),
        ),
        const Spacer(),
        Text(
          '${product.countInStock} in stock',
          style: TextStyle(fontSize: 14.sp, color: AppColors.successColor),
        ),
      ],
    );
  }
}

class _DescriptionSection extends StatelessWidget {
  final Product product;

  const _DescriptionSection({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h),
        ReadMoreText(
          product.description,
          trimLines: 4,
          trimMode: TrimMode.Line,
          trimCollapsedText: '... Show more',
          trimExpandedText: '  Show less',
          moreStyle: TextStyle(
            fontSize: 14.sp,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          lessStyle: TextStyle(
            fontSize: 14.sp,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.secondaryTextColor,
          ),
        ),
      ],
    );
  }
}
