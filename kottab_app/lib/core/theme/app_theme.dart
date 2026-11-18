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
      ),
      headlineLarge: GoogleFonts.tajawal(
        color: AppColors.darkGreenColor,
        fontSize: 18,
        fontWeight: FontWeight.w500
      ),
      headlineMedium: GoogleFonts.tajawal(
        color: AppColors.darkGreyTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w500
      ),
      headlineSmall: GoogleFonts.tajawal(
        color: AppColors.darkGreyTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500
      ),
      labelMedium: GoogleFonts.tajawal(
        color: AppColors.goldenColor,
        fontSize: 14,
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
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: EdgeInsets.symmetric(vertical: 12,horizontal: 13),
      fillColor: AppColors.whiteColor,
      hintStyle: GoogleFonts.tajawal(color: AppColors.darkGreyTextColor,fontSize: 14,fontWeight: FontWeight.w500),
      errorStyle: GoogleFonts.tajawal(color: AppColors.redColor,fontSize: 13,fontWeight: FontWeight.w500),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.textFieldBorderColor,width: 1)
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.textFieldBorderColor,width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.textFieldBorderColor,width: 1)
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.redColor,width: 1)
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.redColor,width: 1)
      ),
    ),
  );
}