
import 'package:artify_app/core/const/app_assets.dart';
import 'package:artify_app/core/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: 320.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Top Collection 🔥',
            style: AppTextStyle.skipButton.copyWith(fontSize: 18.sp),
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              AppIconSvgs.more,
              height: 24.h,
              width: 24.w,
            ),
          ),
        ],
      ),
    );
  }
}
