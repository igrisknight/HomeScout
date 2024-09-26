import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homescout/src/constants/colors.dart';

class HTextTheme{

  static TextTheme lightTextTheme = TextTheme(
      displayLarge: GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.bold, color: hDarkColor),
      displayMedium: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w700,color: hDarkColor,),
      displaySmall:  GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w700,color: hDarkColor,),
      headlineMedium: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600,color: hDarkColor),
      titleLarge: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600, color: hDarkColor,),
  );
  static TextTheme darkTextTheme = TextTheme(displayLarge: GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.bold, color: hDarkColor),
    displayMedium: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w700,color: hWhiteColor,),
    displaySmall:  GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w700,color: hWhiteColor,),
    headlineMedium: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600,color: hWhiteColor),
    titleLarge: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600, color: hWhiteColor,),
  );
}