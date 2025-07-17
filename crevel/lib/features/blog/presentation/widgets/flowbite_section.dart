
// ignore_for_file: deprecated_member_use

import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:crevel/core/utils/flushbar.dart';
import 'package:crevel/features/blog/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlowbiteSection extends StatelessWidget {
  const FlowbiteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 80.h),
          Text(
            'Work fast from anywhere',
            style: AppTextStyles.roboto28Secondary700,
          ),
          SizedBox(height: 16.h),
          Text(
            'Stay up to date and move work forward with Flowbite on iOS & Android. Download the app today.',
            style: AppTextStyles.roboto16Secondary400,
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              CustomButton(
                text: 'Read more',
                backgroundColor: Colors.transparent,
                textColor: AppColors.secondaryText,
                borderColor: AppColors.secondaryText.withOpacity(0.3),
                onTap: () => CustomOverlayFactory.show(context),
              ),
              SizedBox(width: 16.w),
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
    );
  }
}
