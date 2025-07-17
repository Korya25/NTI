// custom_app_bar.dart
import 'package:doctor_hunt/core/constant/app_assets.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_animate_do.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.onBackPressed});

  final String title;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return CustomFadeIn(
      direction: FadeDirection.left,
      child: Row(
        spacing: 18.h,
        children: [
          GestureDetector(
            onTap: onBackPressed ?? () => Navigator.pop(context),
            child: SvgPicture.asset(
              AppIconsSvgs.backButton,
              height: 30.h,
              width: 30.w,
            ),
          ),
          Text(title, style: AppTextStyles.rubik18RegularPrimary),
        ],
      ),
    );
  }
}
