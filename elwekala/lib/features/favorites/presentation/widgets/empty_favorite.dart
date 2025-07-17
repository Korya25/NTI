
import 'package:elwekala/core/constants/app_colors.dart';
import 'package:elwekala/core/constants/app_routes.dart';
import 'package:elwekala/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EmptyFavoriteList extends StatelessWidget {
  const EmptyFavoriteList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 60.sp,
              color: AppColors.iconColor,
            ),
            SizedBox(height: 16.h),
            Text(
              'No favorites yet',
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.secondaryTextColor,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Tap the heart icon to add products to your favorites',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.secondaryTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            CustomButton(
              text: 'Browse Products',
              onPressed: () => context.go(AppRoutes.home),
              width: 200.w,
            ),
          ],
        ),
      );
  }
}
