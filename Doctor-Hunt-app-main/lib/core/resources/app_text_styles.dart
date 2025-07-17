import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/utils/enums.dart';
import 'package:doctor_hunt/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle _rubik({
    required double fontSize,
    required FontWeightType weight,
    double letterSpacing = 0,
    required Color color,
  }) {
    return GoogleFonts.rubik(
      fontSize: fontSize.sp,
      fontWeight: weight.fontWeight,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  static TextStyle get rubik28MediumPrimary => _rubik(
    fontSize: 28,
    weight: FontWeightType.medium,
    letterSpacing: -0.3,
    color: AppColors.primaryTextColor,
  );

  static TextStyle get rubik14RegularTertiary => _rubik(
    fontSize: 14,
    weight: FontWeightType.regular,
    letterSpacing: -0.3,
    color: AppColors.tertiaryTextColor,
  );

  static TextStyle get rubik14LightTertiary => _rubik(
    fontSize: 14,
    weight: FontWeightType.light,
    letterSpacing: -0.3,
    color: AppColors.tertiaryTextColor,
  );

  static TextStyle get rubik18MediumSecondary => _rubik(
    fontSize: 18,
    weight: FontWeightType.medium,
    color: AppColors.secondaryTextColor,
  );

  static TextStyle get rubik14MediumTertiary => _rubik(
    fontSize: 14,
    weight: FontWeightType.medium,
    letterSpacing: -0.3,
    color: AppColors.tertiaryTextColor,
  );

  static TextStyle get rubik20LightSecondary => _rubik(
    fontSize: 20,
    weight: FontWeightType.light,
    letterSpacing: -0.3,
    color: AppColors.secondaryTextColor,
  );

  static TextStyle get rubik25BoldSecondary => _rubik(
    fontSize: 25,
    weight: FontWeightType.bold,
    letterSpacing: -0.3,
    color: AppColors.secondaryTextColor,
  );

  static TextStyle get rubik24MediumPrimary => _rubik(
    fontSize: 24,
    weight: FontWeightType.medium,
    letterSpacing: -0.3,
    color: AppColors.primaryTextColor,
  );

  static TextStyle get rubik26BoldMainPrimary => _rubik(
    fontSize: 26,
    weight: FontWeightType.bold,
    letterSpacing: -0.3,
    color: AppColors.primaryColor,
  );

  // --- Medium Text Styles ---
  static TextStyle get rubik18RegularPrimary => _rubik(
    fontSize: 18,
    weight: FontWeightType.regular,
    letterSpacing: -0.3,
    color: AppColors.primaryTextColor,
  );

  static TextStyle get rubik18MediumPrimary => _rubik(
    fontSize: 18,
    weight: FontWeightType.medium,
    letterSpacing: -0.3,
    color: AppColors.primaryTextColor,
  );

  static TextStyle get rubik16MediumPrimary => _rubik(
    fontSize: 16,
    weight: FontWeightType.medium,
    letterSpacing: -0.3,
    color: AppColors.primaryTextColor,
  );

  static TextStyle get rubik16MediumSecondary => _rubik(
    fontSize: 16,
    weight: FontWeightType.medium,
    letterSpacing: -0.3,
    color: AppColors.secondaryTextColor,
  );

  static TextStyle get rubik16RegularTertiary => _rubik(
    fontSize: 16,
    weight: FontWeightType.regular,
    letterSpacing: -0.3,
    color: AppColors.tertiaryTextColor,
  );

  static TextStyle get rubik16RegularSecondary => _rubik(
    fontSize: 16,
    weight: FontWeightType.regular,
    letterSpacing: -0.3,
    color: AppColors.secondaryTextColor,
  );

  static TextStyle get rubik16LightTertiary => _rubik(
    fontSize: 16,
    weight: FontWeightType.light,
    letterSpacing: -0.3,
    color: AppColors.tertiaryTextColor,
  );

  static TextStyle get rubik15MediumPrimary => _rubik(
    fontSize: 15,
    weight: FontWeightType.medium,
    letterSpacing: -0.3,
    color: AppColors.primaryTextColor,
  );

  static TextStyle get rubik14RegularPrimary => _rubik(
    fontSize: 14,
    weight: FontWeightType.regular,
    letterSpacing: -0.3,
    color: AppColors.primaryTextColor,
  );

  static TextStyle get rubik14LightSecondary => _rubik(
    fontSize: 14,
    weight: FontWeightType.light,
    letterSpacing: -0.3,
    color: AppColors.secondaryTextColor,
  );

  // --- Small Text Styles ---
  static TextStyle get rubik13RegularMainPrimary => _rubik(
    fontSize: 13,
    weight: FontWeightType.regular,
    letterSpacing: -0.3,
    color: AppColors.primaryColor,
  );

  static TextStyle get rubik13MediumMainPrimary => _rubik(
    fontSize: 13,
    weight: FontWeightType.medium,
    letterSpacing: -0.3,
    color: AppColors.primaryColor,
  );

  static TextStyle get rubik12LightTertiary => _rubik(
    fontSize: 12,
    weight: FontWeightType.light,
    letterSpacing: -0.3,
    color: AppColors.tertiaryTextColor,
  );

  static TextStyle get rubik12RegularTertiary => _rubik(
    fontSize: 12,
    weight: FontWeightType.regular,
    letterSpacing: -0.3,
    color: AppColors.tertiaryTextColor,
  );

  static TextStyle get rubik12RegularSecondary => _rubik(
    fontSize: 12,
    weight: FontWeightType.regular,
    letterSpacing: -0.3,
    color: AppColors.secondaryTextColor,
  );

  static TextStyle get rubik12MediumPrimary => _rubik(
    fontSize: 12,
    weight: FontWeightType.medium,
    letterSpacing: -0.3,
    color: AppColors.primaryTextColor,
  );

  static TextStyle get rubik12MediumSecondary => _rubik(
    fontSize: 12,
    weight: FontWeightType.medium,
    letterSpacing: -0.3,
    color: AppColors.secondaryTextColor,
  );

  static TextStyle get rubik12MediumTertiary => _rubik(
    fontSize: 12,
    weight: FontWeightType.medium,
    letterSpacing: -0.3,
    color: AppColors.tertiaryTextColor,
  );

  static TextStyle get rubik10BoldPrimary => _rubik(
    fontSize: 10,
    weight: FontWeightType.bold,
    letterSpacing: -0.3,
    color: AppColors.primaryTextColor,
  );

  static TextStyle get rubik9LightTertiary => _rubik(
    fontSize: 9,
    weight: FontWeightType.light,
    letterSpacing: -0.3,
    color: AppColors.tertiaryTextColor,
  );
}
