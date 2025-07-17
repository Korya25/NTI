import 'package:crevel/core/constants/app_assets.dart';

import 'package:crevel/core/presentation/widgets/animated_star.dart';
import 'package:crevel/core/presentation/widgets/app_background_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBackgroundWidget extends StatelessWidget {
  const HomeBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          AppBackgroundWidget(showLight: false),
          Positioned(
            top: 0.15.sh,
            right: -0.1.sw,
            child: Image.asset(AppAssets.grid, height: 180.h, width: 180.w),
          ),
          Positioned(
            right: -0.05.sw,
            top: 0.1.sh,
            child: Image.asset(AppAssets.person, width: 250.w, height: 280.h),
          ),

          Positioned(
            left: 40.w,
            bottom: 30.h,
            child: AnimatedStar(animate: false, stars: true, size: 30.r),
          ),
          Positioned(
            right: 40.w,
            top: 80.h,
            child: AnimatedStar(animate: false, size: 30.r),
          ),
        ],
      ),
    );
  }
}
