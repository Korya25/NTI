import 'dart:io';

import 'package:elwekala/core/constants/app_colors.dart';
import 'package:elwekala/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImagePicker extends StatelessWidget {
  final File? image;
  final VoidCallback onTap;

  const ProfileImagePicker({
    super.key,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.secondaryColor,
          border: Border.all(color: AppColors.borderColor, width: 2),
        ),
        child: image != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: Image.file(image!, fit: BoxFit.cover),
              )
            : Icon(Icons.camera_alt, size: 40.sp, color: AppColors.iconColor),
      ),
    );
  }
}

class GenderSelector extends StatelessWidget {
  final String? selectedGender;
  final ValueChanged<String?> onChanged;

  const GenderSelector({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.gender,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryTextColor,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: Text(AppStrings.male),
                value: AppStrings.male,
                groupValue: selectedGender,
                onChanged: onChanged,
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: Text(AppStrings.female),
                value: AppStrings.female,
                groupValue: selectedGender,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
