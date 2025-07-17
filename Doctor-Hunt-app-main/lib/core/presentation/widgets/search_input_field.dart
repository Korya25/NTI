import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_animate_do.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField({
    super.key,
    this.elevation,
    this.borderRaduis,
    this.cursorColor,
    this.fillColor,
    this.filled,
    this.closeOnTap,
    this.iconColor,
    required this.hintText,
  });
  final double? elevation;
  final double? borderRaduis;
  final Color? cursorColor;
  final Color? iconColor;
  final Color? fillColor;
  final bool? filled;
  final VoidCallback? closeOnTap;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return CustomFadeIn(
      direction: FadeDirection.right,
      child: Material(
        elevation: elevation ?? 0.4,
        borderRadius: BorderRadius.circular(borderRaduis ?? 6.r),
        child: TextField(
          cursorColor: cursorColor ?? AppColors.primaryTextColor,
          decoration: InputDecoration(
            fillColor: fillColor ?? AppColors.secondaryColor,
            filled: filled ?? true,
            suffixIcon: GestureDetector(
              onTap: closeOnTap,
              child: Icon(
                Icons.close,
                size: 18.w,
                color: iconColor ?? AppColors.tertiaryTextColor,
              ),
            ),
            prefixIcon: Icon(
              Icons.search,
              size: 18.w,
              color: iconColor ?? AppColors.tertiaryTextColor,
            ),
            hintText: hintText,
            hintStyle: AppTextStyles.rubik14RegularTertiary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
