import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homescout/src/constants/colors.dart';

class HTextTheme{

  static TextTheme lightTextTheme = TextTheme(
    //headline1
      displayLarge: GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.bold, color: hDarkColor),
      //headline2
      displayMedium: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w700,color: hDarkColor,),
      //headline3
      displaySmall:  GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w700,color: hDarkColor,),
      //headline4
      headlineMedium: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600,color: hDarkColor),
      //headline6
      titleLarge: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600, color: hDarkColor,),
      //bodyText1
      bodyLarge: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w700, color: hDarkColor,),
      //bodyText2
      bodyMedium: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600, color: hDarkColor),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.bold, color: hWhiteColor),
    displayMedium: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w700,color: hWhiteColor,),
    displaySmall:  GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w700,color: hWhiteColor,),
    headlineMedium: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600,color: hWhiteColor),
    titleLarge: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600, color: hWhiteColor,),
    bodyLarge: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w700, color: hWhiteColor,),
    bodyMedium: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w400, color: hWhiteColor),
  );
}