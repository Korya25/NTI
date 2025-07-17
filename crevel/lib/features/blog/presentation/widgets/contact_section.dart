
import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:crevel/features/blog/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      child: Column(
        children: [
          Text('CONTACT US', style: AppTextStyles.roboto36Primary700),
          SizedBox(height: 16.h),
          Text(
            'Let\'s Start Something Great Together',
            style: AppTextStyles.roboto22Secondary500,
          ),
          SizedBox(height: 32.h),
          CustomButton(
            text: 'Let\'s Talk',
            backgroundColor: AppColors.primaryText,
            textColor: Colors.white,
            isLarge: true,
          ),
        ],
      ),
    );
  }
}
