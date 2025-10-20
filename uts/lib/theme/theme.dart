import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.primaryDark,
  ),
  textTheme: GoogleFonts.poppinsTextTheme(
    const TextTheme(
      displayLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
      displayMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
      displaySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    ),
  ).apply(
    bodyColor: AppColors.textDark,
    displayColor: AppColors.textDark,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: const IconThemeData(color: AppColors.textDark),
    titleTextStyle: GoogleFonts.poppins(
      color: AppColors.textDark,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
);
