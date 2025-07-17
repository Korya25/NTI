
// ignore_for_file: deprecated_member_use

import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback? onTap;

  const BlogCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.homeSection,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: AppColors.primaryText.withOpacity(0.2),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Row(
            children: [
              // Image section with improved placeholder
              ClipRRect(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(12.r),
                ),
                child: Container(
                  width: 120.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primaryText.withOpacity(0.6),
                        AppColors.main.withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.article_outlined,
                      size: 40.sp,
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
              ),
              // Content section
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.roboto16Secondary600,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        description,
                        style: AppTextStyles.roboto14Secondary400,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

