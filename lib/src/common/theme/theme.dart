import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'package:prueba_tecnica/src/common/theme/colors.dart';

ThemeData lightThemeData = ThemeData(
  primarySwatch: AppColors.primaryColor.toMaterialColor(),
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  cardColor: AppColors.white,
  hoverColor: AppColors.primaryColor.withOpacity(0.2),
  brightness: Brightness.light,
  // hintColor: AppColors.black,
  listTileTheme: ListTileThemeData(
    selectedTileColor: AppColors.primaryColor.withOpacity(0.1),
    iconColor: AppColors.iconUnSelect,
    titleTextStyle: GoogleFonts.roboto(
      fontSize: 14,
      color: AppColors.textColor,
      fontWeight: FontWeight.normal,
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryColor,
    secondary: AppColors.primaryColor,
    onSecondary: AppColors.white,
    onBackground: AppColors.textColor,
    onSurface: AppColors.textColor,
    error: AppColors.red,
    onError: AppColors.red,
  ),
  iconTheme: const IconThemeData(
    color: AppColors.primaryColor,
    size: 24,
  ),
  primaryIconTheme: const IconThemeData(
    color: AppColors.primaryColor,
    size: 24,
  ),
  // alert dialog
  dialogTheme: const DialogTheme(
    backgroundColor: AppColors.white,
    surfaceTintColor: AppColors.white,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.primaryColor,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // surfaceTintColor: AppColors.primaryColor,
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.white,
      splashFactory: InkRipple.splashFactory,
      // color de splash cuando se presiona
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: GoogleFonts.roboto(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          side: const BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textStyle: MaterialStateProperty.all(
        GoogleFonts.roboto(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      side: MaterialStateProperty.all(
        const BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      backgroundColor: MaterialStateProperty.all(AppColors.white),
      foregroundColor: MaterialStateProperty.all(AppColors.primaryColor),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textStyle: MaterialStateProperty.all(
        GoogleFonts.roboto(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.white,
    elevation: 10,
    centerTitle: false,
    titleSpacing: 0,
    iconTheme: const IconThemeData(
      color: AppColors.primaryColor,
      size: 24,
    ),
    titleTextStyle: GoogleFonts.roboto(
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.roboto(
      fontSize: 26,
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.roboto(
      fontSize: 22,
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: GoogleFonts.roboto(
      fontSize: 18,
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
    ),
    displayLarge: GoogleFonts.roboto(
      fontSize: 24,
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: GoogleFonts.roboto(
      fontSize: 20,
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: GoogleFonts.roboto(
      fontSize: 16,
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: GoogleFonts.roboto(
      fontSize: 16,
      color: AppColors.textColor,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 14,
      color: AppColors.textColor,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: GoogleFonts.roboto(
      fontSize: 12,
      color: AppColors.textColor,
      fontWeight: FontWeight.normal,
    ),
  ),
);
