import 'package:artify_app/core/resources/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle onboardingTitle = GoogleFonts.spaceGrotesk(
    fontWeight: FontWeight.bold,
    fontSize: 36.sp,
    color: AppColors.black,
  );
  static TextStyle onboardingSubtitle = GoogleFonts.spaceGrotesk(
    fontWeight: FontWeight.w100,
    fontSize: 16.sp,
    color: AppColors.grey,
  );
  static TextStyle skipButton = GoogleFonts.spaceGrotesk(
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
    color: AppColors.black,
  );
  static TextStyle categoryFilter = GoogleFonts.spaceGrotesk(
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
  );
}
