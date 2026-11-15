import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kottab_app/core/resources/app_colors.dart';

class AppTheme {
  static final lightTheme=ThemeData(
    scaffoldBackgroundColor: AppColors.primaryColor,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.tajawal(
        color: AppColors.blackColor,
        fontSize: 20,
        fontWeight: FontWeight.w700
      ),
      titleMedium: GoogleFonts.tajawal(
        color: AppColors.darkGreySkipColor,
        fontSize: 18,
        fontWeight: FontWeight.w500
      ),
      titleSmall: GoogleFonts.tajawal(
        color: AppColors.blackColor,
        fontSize: 16,
        fontWeight: FontWeight.w500
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkGreenColor,
        foregroundColor: AppColors.whiteColor,
        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
        textStyle: GoogleFonts.tajawal(
          color: AppColors.whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w500
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16))
      )
    )
  );
}