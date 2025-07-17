import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomeSection extends StatelessWidget {
  const CustomHomeSection({
    super.key,
    required this.headerSection,
    required this.horizontallistView,
  });
  final Widget headerSection;
  final Widget horizontallistView;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontal20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.h),
          CustomFadeIn(direction: FadeDirection.left, child: headerSection),
          SizedBox(height: 12.h),

          horizontallistView,
        ],
      ),
    );
  }
}
