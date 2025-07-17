
import 'package:artify_app/core/const/app_assets.dart';
import 'package:artify_app/core/const/app_string.dart';
import 'package:artify_app/core/resources/app_colors.dart';
import 'package:artify_app/core/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TitleSubtitle extends StatelessWidget {
  const TitleSubtitle({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      children: [
        // title
        Stack(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: AppTextStyle.onboardingTitle,

                children: [
                  TextSpan(text: title),
                  TextSpan(text: ' '),
                  TextSpan(
                    text: AppString.logoName,
                    style: AppTextStyle.onboardingTitle.copyWith(
                      color: AppColors.green,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -1,
              right: 30,
              child: SvgPicture.asset(AppIconSvgs.linemark),
            ),
          ],
        ),
        // subtitle
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: AppTextStyle.onboardingSubtitle,
        ),
      ],
    );
  }
}
