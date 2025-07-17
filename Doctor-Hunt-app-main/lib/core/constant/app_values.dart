import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPadding {
  // === All Sides Padding ===
  static EdgeInsetsGeometry get all8 => EdgeInsets.all(8.r);
  static EdgeInsetsGeometry get all10 => EdgeInsets.all(10.r);
  static EdgeInsetsGeometry get all12 => EdgeInsets.all(12.r);
  static EdgeInsetsGeometry get all16 => EdgeInsets.all(16.r);

  // === Horizontal Padding ===
  static EdgeInsetsGeometry get horizontal20 =>
      EdgeInsets.symmetric(horizontal: 20.w);
  static EdgeInsetsGeometry get horizontal25 =>
      EdgeInsets.symmetric(horizontal: 25.w);
  static EdgeInsetsGeometry get horizontal30 =>
      EdgeInsets.symmetric(horizontal: 30.w);

  // === Vertical Padding ===
  static EdgeInsetsGeometry get vertical10 =>
      EdgeInsets.symmetric(vertical: 10.h);
  static EdgeInsetsGeometry get vertical12 =>
      EdgeInsets.symmetric(vertical: 12.h);

  // === Combined Horizontal & Vertical Padding ===
  static EdgeInsetsGeometry get h8v8 =>
      EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h);

  static EdgeInsetsGeometry get h10v10 =>
      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h);

  static EdgeInsetsGeometry get h12v14 =>
      EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h);

  static EdgeInsetsGeometry get h16v14 =>
      EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h);

  static EdgeInsetsGeometry get h20v16 =>
      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h);

  static EdgeInsetsGeometry get h20v20 =>
      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h);

  // === Directional Padding ===
  static EdgeInsetsGeometry get bottom16 => EdgeInsets.only(bottom: 16.h);
  static EdgeInsetsGeometry get bottom20 => EdgeInsets.only(bottom: 20.h);
}
