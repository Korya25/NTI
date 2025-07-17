import 'package:elwekala/core/constants/app_colors.dart';
import 'package:elwekala/core/widgets/image_with_shimmer.dart';
import 'package:elwekala/features/home/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image with Status Badge
            _ProductImageSection(product: product),

            // Product Details
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name & Brand
                  _ProductTitleSection(product: product),
                  SizedBox(height: 8.h),

                  // Price & Rating
                  _ProductPriceRatingSection(product: product),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: AppColors.surfaceColor,
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(13),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }
}

class _ProductImageSection extends StatelessWidget {
  final Product product;

  const _ProductImageSection({required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
          child: ImageWithShimmer(
            imageUrl: product.image,
            width: double.infinity,
            height: 125.h,
          ),
        ),

        // Used Badge
        if (product.status == 'Used') _buildUsedBadge(),
      ],
    );
  }

  Widget _buildUsedBadge() {
    return Positioned(
      top: 8.w,
      left: 8.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Text(
          'Used',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _ProductTitleSection extends StatelessWidget {
  final Product product;

  const _ProductTitleSection({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Name
        Text(
          product.name.trim(),

          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            height: 1.3,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        // Company
        Text(
          product.company,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.secondaryTextColor,
          ),
        ),
      ],
    );
  }
}

class _ProductPriceRatingSection extends StatelessWidget {
  final Product product;

  const _ProductPriceRatingSection({required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Price
        Text(
          '\$${product.price.toStringAsFixed(2)}',
          maxLines: 1,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
        ),

        // Rating
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star_rounded, color: Colors.amber, size: 16.sp),
            SizedBox(width: 4.w),
            Text(
              0.toStringAsFixed(1),
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}
