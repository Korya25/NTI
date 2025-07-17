import 'package:crevel/core/utils/app_validators.dart';
import 'package:flutter/material.dart';
import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownField extends StatelessWidget {
  final String? value;
  final List<String> items;
  final String hintText;
  final void Function(String?) onChanged;
  final String? Function(String?)? validator;
  final bool autoValidate;

  final Color? backgroundColor;
  final Color? borderColor;
  final Color? dropdownColor;
  final Color? textColor;
  final Color? hintColor;
  final Color? iconColor;
  final Color? selectedItemColor;
  final double? borderWidth;
  final double? borderRadius;

  const CustomDropdownField({
    super.key,
    required this.value,
    required this.items,
    required this.hintText,
    required this.onChanged,
    this.validator,
    this.autoValidate = true,
    this.backgroundColor,
    this.borderColor,
    this.dropdownColor,
    this.textColor,
    this.hintColor,
    this.iconColor,
    this.selectedItemColor,
    this.borderWidth,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey[800],
        borderRadius: BorderRadius.circular((borderRadius ?? 8).r),
        border: value != null
            ? Border.all(
                color: borderColor ?? AppColors.primaryText,
                width: (borderWidth ?? 2).w,
              )
            : null,
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        dropdownColor: dropdownColor ?? Colors.grey[800],
        style: AppTextStyles.roboto18Secondary500.copyWith(
          color: textColor ?? AppTextStyles.roboto18Secondary500.color,
          fontSize: 18.sp,
        ),
        autovalidateMode: autoValidate
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.roboto18Secondary500.copyWith(
            color: hintColor ?? Colors.grey[400],
            fontSize: 18.sp,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16.w),
        ),
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: iconColor ?? AppColors.primaryText,
          size: 24.sp,
        ),
        validator: validator ?? AppValidators.validateDropdown,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: AppTextStyles.roboto18Secondary500.copyWith(
                color: selectedItemColor ??
                    AppTextStyles.roboto18Secondary500.color,
                fontSize: 18.sp,
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}

