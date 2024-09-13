import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HTextTheme{

  static TextTheme lightTextTheme = TextTheme(
      displayMedium: GoogleFonts.montserrat(
        color: Colors.black87,
      ),
      titleMedium: GoogleFonts.montserrat(
        color: Colors.black54,
        fontSize: 24,
      ),
      headlineMedium: GoogleFonts.montserrat(
        color: Colors.black87,
        fontSize: 22,
        fontWeight: FontWeight.w900,
      ),
      headlineSmall: GoogleFonts.montserrat(
        color: Colors.black87,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
  );
  static TextTheme darkTextTheme = TextTheme(
      displayMedium: GoogleFonts.montserrat(
        color: Colors.white70,
      ),
      titleMedium: GoogleFonts.montserrat(
        color: Colors.white60,
        fontSize: 24,
      ),

    headlineMedium: GoogleFonts.montserrat(
      color: Colors.white60,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: GoogleFonts.montserrat(
      color: Colors.white60,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}