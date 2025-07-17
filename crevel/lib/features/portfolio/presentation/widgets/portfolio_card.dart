// ignore_for_file: deprecated_member_use

import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortfolioCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final IconData icon;
  final Color color;

  const PortfolioCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      child: Stack(
        children: [
          // Background Card
          _CardBackground(color: color),
          // Content
          _CardContent(
            title: title,
            description: description,
            category: category,
            icon: icon,
          ),
        ],
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {
  final Color color;

  const _CardBackground({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color.withOpacity(0.9), color.withOpacity(0.7)],
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 20.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Stack(
          children: [
            // Background gradient overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.white.withOpacity(0.1), Colors.transparent],
                  ),
                ),
              ),
            ),
            // Decorative shapes
            Positioned(
              top: -20.h,
              right: -20.w,
              child: Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            Positioned(
              bottom: -15.h,
              left: -15.w,
              child: Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardContent extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final IconData icon;

  const _CardContent({
    required this.title,
    required this.description,
    required this.category,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Category badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              category,
              style: AppTextStyles.roboto14Primary600.copyWith(
                color: Colors.white,
                fontSize: 12.sp,
              ),
            ),
          ),
          SizedBox(height: 12.h),

          // Icon
          Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: Colors.white, size: 22.sp),
          ),
          SizedBox(height: 12.h),

          // Title
          Text(
            title,
            style: AppTextStyles.roboto22Secondary500.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),

          // Description
          Flexible(
            child: Text(
              description,
              style: AppTextStyles.roboto14Secondary400.copyWith(
                color: Colors.white.withOpacity(0.9),
                height: 1.3,
                fontSize: 10.sp,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 6.h),

          // Action row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'View Project',
                style: AppTextStyles.roboto14Primary600.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 10.sp,
                ),
              ),
              Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 18.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
