// ignore_for_file: deprecated_member_use

import 'package:crevel/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextStyle roboto18Secondary500 = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryText,
  );

  static final TextStyle roboto22Secondary500 = GoogleFonts.roboto(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryText,
    letterSpacing: 0.3,
  );

  static final TextStyle roboto16Secondary600 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.secondaryText,
  );

  static final TextStyle roboto14Secondary400 = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryText.withOpacity(0.9),
  );

  static final TextStyle roboto14Primary600 = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
  );

  // Additional styles for the new sections
  static final TextStyle roboto28Secondary700 = GoogleFonts.roboto(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.secondaryText,
  );

  static final TextStyle roboto36Primary700 = GoogleFonts.roboto(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
    letterSpacing: 2.0,
  );

  static final TextStyle roboto28Primary600 = GoogleFonts.roboto(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
  );

  static final TextStyle roboto16Secondary400 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryText.withOpacity(0.8),
  );
  static TextStyle dynamicStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    double? letterSpacing,
    double opacity = 1.0,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color.withOpacity(opacity),
      letterSpacing: letterSpacing,
    );
  }
}
