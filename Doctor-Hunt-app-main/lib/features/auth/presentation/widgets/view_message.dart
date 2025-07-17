import 'package:doctor_hunt/core/presentation/widgets/custom_animate_do.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewMessage extends StatelessWidget {
  const ViewMessage({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return CustomFadeIn(
      duration: 500,
      direction: FadeDirection.down,
      child: Column(
        spacing: 10.h,
        children: [
          // title
          Text(
            title,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: AppTextStyles.rubik24MediumPrimary,
          ),

          // subtitle
          Text(
            subtitle,

            maxLines: 2,
            textAlign: TextAlign.center,
            style: AppTextStyles.rubik14RegularPrimary,
          ),
        ],
      ),
    );
  }
}
