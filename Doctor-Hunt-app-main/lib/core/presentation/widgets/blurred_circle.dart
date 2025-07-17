import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBlurredCircle extends StatelessWidget {
  const CustomBlurredCircle({
    super.key,
    required this.color,
    this.size,
    this.blurSigma,
    this.opacity,
  });
  final Color color;
  final double? size;
  final double? blurSigma;
  final int? opacity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 250.h,
      width: size ?? 250.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withAlpha(opacity ?? 115),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blurSigma ?? 269,
          sigmaY: blurSigma ?? 269,
        ),
        child: Container(color: Colors.transparent),
      ),
    );
  }
}
