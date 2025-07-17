import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRichText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final TextStyle? firstTextStyle;
  final TextStyle? secondTextStyle;
  final TextAlign? textAlign;
  final bool addLineBreak;

  const CustomRichText({
    super.key,
    required this.firstText,
    required this.secondText,
    this.firstTextStyle,
    this.secondTextStyle,
    this.textAlign = TextAlign.center,
    this.addLineBreak = true,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.center,

      text: TextSpan(
        children: [
          TextSpan(
            text: firstText + (addLineBreak ? '\n' : ' '),
            style:
                firstTextStyle ??
                AppTextStyles.roboto22Secondary500.copyWith(
                  color: AppColors.primaryText,
                  fontSize: 22.sp,
                ),
          ),
          TextSpan(
            text: secondText,
            style:
                secondTextStyle ??
                AppTextStyles.roboto22Secondary500.copyWith(fontSize: 22.sp),
          ),
        ],
      ),
    );
  }
}
