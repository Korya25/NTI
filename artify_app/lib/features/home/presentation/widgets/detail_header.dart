import 'package:artify_app/core/const/app_assets.dart';
import 'package:artify_app/core/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: SvgPicture.asset(
            AppIconSvgs.arrowBackIOs,
            height: 24.h,
            width: 24.w,
          ),
        ),
        Text(title, style: AppTextStyle.skipButton.copyWith(fontSize: 18.sp)),
        SizedBox(width: 24.w),
      ],
    );
  }
}
