// themes.dart

import 'package:flutter/material.dart';
import 'app_colors.dart';
// import 'package:google_fonts/google_fonts.dart';

// Light Theme
final ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: AppColors.scaffoldBackgroundColor,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimaryColor),
    ),
    // useMaterial3: true,
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      primary: AppColors.primaryColor,
      secondary: AppColors.inversePrimaryColor,
      inversePrimary: AppColors.inversePrimaryColor,
      tertiary: AppColors.textPrimaryColor,
    ),
    cardColor: AppColors.cardColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 64,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimaryColor),
      displayMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimaryColor),
      displaySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimaryColor),
      headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimaryColor),
      bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimaryColor),
    ));

// Dark Theme
final ThemeData darkTheme = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(
    color: AppDarkColors.scaffoldBackgroundColor,
    elevation: 0,
    titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppDarkColors.textPrimaryColor),
    actionsIconTheme: IconThemeData(
      color: AppColors.textPrimaryColor,
    ),
  ),

  // fontFamily: 'Roboto',
  scaffoldBackgroundColor: AppDarkColors.scaffoldBackgroundColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppDarkColors.primaryColor,
    primary: AppDarkColors.primaryColor,
    secondary: AppDarkColors.inversePrimaryColor,
    inversePrimary: AppDarkColors.inversePrimaryColor,
    tertiary: AppDarkColors.textPrimaryColor,
  ),

  cardColor: AppDarkColors.cardColor,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 64,
        fontWeight: FontWeight.w400,
        color: AppDarkColors.textPrimaryColor),
    displayMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppDarkColors.textPrimaryColor),
    displaySmall: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppDarkColors.textPrimaryColor),
    headlineLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppDarkColors.textPrimaryColor),
    bodySmall: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppDarkColors.textPrimaryColor),
  ),
  // ... other dark theme properties
);
