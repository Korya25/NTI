
// portfolio_header.dart

import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PortfolioHeader extends StatelessWidget {
  const PortfolioHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PORTFOLIO',
          style: AppTextStyles.roboto36Primary700.copyWith(
            fontSize: 36.sp,
          ),
        ),
        SizedBox(height: isSmallScreen ? 15.h : 20.h),
        Text(
          'Welcome to my digital showcase! Explore my journey through innovative design, cutting-edge development, and creative solutions. Each project represents a unique challenge conquered with passion and precision.',
          style: AppTextStyles.roboto16Secondary400.copyWith(
            fontSize: 16.sp,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}

