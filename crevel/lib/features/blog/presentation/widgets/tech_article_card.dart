
// ignore_for_file: deprecated_member_use

import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:crevel/core/utils/flushbar.dart';
import 'package:crevel/features/blog/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechArticleCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const TechArticleCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.homeSection,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primaryText.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            child: Container(
              height: 200.h,
              width: double.infinity,
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
                  Icons.person,
                  size: 80.sp,
                  color: AppColors.primaryText,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.roboto22Secondary500),
                SizedBox(height: 12.h),
                Text(description, style: AppTextStyles.roboto14Secondary400),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    CustomButton(
                      onTap: () => CustomOverlayFactory.show(context),
                      text: 'Read more',
                      backgroundColor: Colors.transparent,
                      textColor: AppColors.secondaryText,
                      borderColor: AppColors.secondaryText.withOpacity(0.3),
                    ),
                    SizedBox(width: 12.w),
                    CustomButton(
                      onTap: () => CustomOverlayFactory.show(context),
                      text: 'Explore insights',
                      backgroundColor: AppColors.primaryText,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
