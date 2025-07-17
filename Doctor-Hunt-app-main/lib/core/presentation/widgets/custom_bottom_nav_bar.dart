// ignore_for_file: deprecated_member_use

import 'package:doctor_hunt/core/constant/app_assets.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const _icons = [
    AppIconsSvgs.homeBottomNav,
    AppIconsSvgs.heartBottomNav,
    AppIconsSvgs.bookBottomNav,
    AppIconsSvgs.messageBottomNav,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.r,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: AppPadding.horizontal30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_icons.length, (index) {
          final isSelected = index == currentIndex;
          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              padding: AppPadding.all12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.green : Colors.transparent,
              ),
              child: SvgPicture.asset(
                _icons[index],
                colorFilter: ColorFilter.mode(
                  isSelected ? Colors.white : Colors.grey,
                  BlendMode.srcIn,
                ),
                width: 23.w,
                height: 20.h,
              ),
            ),
          );
        }),
      ),
    );
  }
}
