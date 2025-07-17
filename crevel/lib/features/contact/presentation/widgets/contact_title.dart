import 'package:flutter/material.dart';
import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/resources/app_text_styles.dart';

class ContactTitle extends StatelessWidget {
  const ContactTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: "Let's ", style: AppTextStyles.roboto22Secondary500),
          TextSpan(
            text: "talk business",
            style: AppTextStyles.roboto22Secondary500.copyWith(
              color: AppColors.primaryText,
            ),
          ),
          TextSpan(
            text: ".\nBut you first.",
            style: AppTextStyles.roboto22Secondary500,
          ),
        ],
      ),
    );
  }
}

