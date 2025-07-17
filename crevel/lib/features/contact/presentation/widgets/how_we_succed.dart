// ignore_for_file: deprecated_member_use

import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:crevel/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HowWeSucceedWidget extends StatelessWidget {
  const HowWeSucceedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.main,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          const SectionHeaderWidget(
            title: "HOW WE SUCCEED",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.h),
          const ProcessStepWidget(
            title: "DISCOVER",
            description:
                "We start by understanding your goals, audience, and business needs to create a foundation for success.",
          ),
          SizedBox(height: 20.h),
          const ProcessStepWidget(
            title: "DISCOVER",
            description:
                "We start by understanding your goals, audience, and business needs to create a foundation for success.",
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}

class ProcessStepWidget extends StatelessWidget {
  final String title;
  final String description;
  final EdgeInsetsGeometry? padding;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;

  const ProcessStepWidget({
    super.key,
    required this.title,
    required this.description,
    this.padding,
    this.titleStyle,
    this.descriptionStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                titleStyle ??
                AppTextStyles.roboto28Secondary700.copyWith(
                  fontSize: 24.sp,
                  color: AppColors.secondaryText,
                ),
          ),
          SizedBox(height: 12.h),
          Text(
            description,
            style:
                descriptionStyle ??
                AppTextStyles.roboto16Secondary400.copyWith(
                  fontSize: 16.sp,
                  height: 1.5,
                  color: AppColors.secondaryText.withOpacity(0.8),
                ),
          ),
        ],
      ),
    );
  }
}
