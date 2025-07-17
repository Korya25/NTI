import 'package:crevel/core/utils/app_validators.dart';
import 'package:flutter/material.dart';
import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final int maxLines;
  final String? Function(String?)? validator;
  final bool isRequired;
  final bool autoValidate;
  final String? validationFieldName;
  final int? minLength;
  final int? maxLength;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.validator,
    this.isRequired = false,
    this.autoValidate = true,
    this.validationFieldName,
    this.minLength,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        autovalidateMode: autoValidate
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        validator: validator ?? _getDefaultValidator(),
        style: AppTextStyles.roboto18Secondary500.copyWith(
          fontSize: 18.sp,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.roboto18Secondary500.copyWith(
            color: Colors.grey[400],
            fontSize: 18.sp,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16.w),
        ),
      ),
    );
  }

  String? Function(String?)? _getDefaultValidator() {
    if (!isRequired && validator == null) return null;

    return (String? value) {
      // Custom validator takes precedence
      if (validator != null) {
        return validator!(value);
      }

      switch (keyboardType) {
        case TextInputType.emailAddress:
          return AppValidators.validateEmail(value);
        case TextInputType.phone:
          return AppValidators.validatePhone(value);
        default:
          if (isRequired) {
            if (validationFieldName != null) {
              return AppValidators.validateCustom(
                value,
                validationFieldName!,
                minLength: minLength,
                maxLength: maxLength,
              );
            }
            return AppValidators.validateRequired(value);
          }
          return null;
      }
    };
  }
}

