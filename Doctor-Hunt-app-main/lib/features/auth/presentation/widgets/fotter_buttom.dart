import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';

class FooterButtons extends StatelessWidget {
  const FooterButtons({super.key, required this.onTap, required this.title});
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: AppTextStyles.rubik14RegularPrimary.copyWith(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
