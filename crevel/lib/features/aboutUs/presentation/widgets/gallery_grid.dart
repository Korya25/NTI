// ignore_for_file: deprecated_member_use

import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/features/aboutUs/data/models/gallery_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GalleryGrid extends StatelessWidget {
  final List<GalleryItemModel> items;

  const GalleryGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(2, (rowIndex) {
        final first = items[rowIndex * 2];
        final second = items[rowIndex * 2 + 1];
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Row(
            children: [
              Expanded(
                child: GalleryItem(
                  imagePath: first.imagePath,
                  aspectRatio: first.aspectRatio,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: GalleryItem(
                  imagePath: second.imagePath,
                  aspectRatio: second.aspectRatio,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class GalleryItem extends StatelessWidget {
  final String imagePath;
  final double aspectRatio;

  const GalleryItem({
    super.key,
    required this.imagePath,
    this.aspectRatio = 16 / 9,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.homeSection,
        border: Border.all(
          color: AppColors.primaryText.withOpacity(0.2),
          width: 1.w,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Center(
              child: Icon(
                Icons.image_not_supported,
                color: AppColors.primaryText,
                size: 40.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
