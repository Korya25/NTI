import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final bool readOnly;
  final int maxLines;
  final TextCapitalization textCapitalization;
  final bool enabled;

  const AuthTextFormFieldWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.readOnly = false,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onTap: onTap,
      onChanged: onChanged,
      readOnly: readOnly,
      maxLines: maxLines,
      cursorColor: AppColors.tertiaryTextColor,
      cursorErrorColor: AppColors.tertiaryTextColor,
      textCapitalization: textCapitalization,
      enabled: enabled,
      style: AppTextStyles.rubik16LightTertiary,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.rubik16LightTertiary,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        contentPadding: AppPadding.h20v16,

        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        errorBorder: buildBorder(),
        focusedErrorBorder: buildBorder(),
        fillColor: Colors.transparent,
        filled: true,
      ),
    );
  }

  // build boreder
  InputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
    );
  }
}
