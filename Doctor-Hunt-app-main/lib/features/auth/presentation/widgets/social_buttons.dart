import 'package:doctor_hunt/core/constant/app_assets.dart';
import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_animate_do.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_buttom.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // google
        CustomFadeIn(
          direction: FadeDirection.left,
          child: buildSocialButtonsItem(
            title: AppString.google,
            svgIcon: AppIconsSvgs.google,
            onTap: () {},
          ),
        ),
        // facebook
        CustomFadeIn(
          direction: FadeDirection.right,

          child: buildSocialButtonsItem(
            title: AppString.facebook,
            svgIcon: AppIconsSvgs.facebook,
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget buildSocialButtonsItem({
    required String title,
    required String svgIcon,
    required VoidCallback onTap,
  }) {
    return CustomButtom(
      height: 54.h,
      width: 160.w,
      onTap: onTap,
      borderRadius: 12.r,
      color: AppColors.secondaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 12.w,
        children: [
          SvgPicture.asset(svgIcon, height: 24.h, width: 24.w),
          Text(title, maxLines: 1, style: AppTextStyles.rubik16LightTertiary),
        ],
      ),
    );
  }
}
