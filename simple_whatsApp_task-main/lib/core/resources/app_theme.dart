import 'package:flutter/material.dart';
import 'package:simple_whats_app/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkAppBar,
      foregroundColor: AppColors.darkText,
      iconTheme: IconThemeData(color: AppColors.darkIcon),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkAppBar,
      selectedItemColor: AppColors.darkIcon,
      unselectedItemColor: AppColors.darkIcon2,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
    iconTheme: const IconThemeData(color: AppColors.darkIcon),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkText),
      bodyMedium: TextStyle(color: AppColors.darkText),
    ),
  );
}
