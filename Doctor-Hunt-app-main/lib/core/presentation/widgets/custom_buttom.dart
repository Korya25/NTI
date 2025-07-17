import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    this.title,
    this.height,
    this.width,
    this.color,
    this.borderRadius,
    this.onTap,
    this.textStyle,
    this.child,
  });
  final String? title;
  final double? height;
  final double? width;
  final Color? color;
  final double? borderRadius;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
        ),
        child: Center(
          child:
              child ??
              Text(
                title ?? 'Null',
                style: textStyle ?? AppTextStyles.rubik18MediumSecondary,
              ),
        ),
      ),
    );
  }
}
