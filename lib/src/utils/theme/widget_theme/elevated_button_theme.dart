import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

//Light and Dark Elevated Button theme//
class HElevatedButtonTheme {
  HElevatedButtonTheme._();

  //light theme//
  static final LightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: hWhiteColor,
      backgroundColor: hSecondaryColor,
      side: BorderSide(color: hSecondaryColor),
      padding: EdgeInsets.symmetric(vertical: hButtonHeight),
    ),
  );

  //dark theme//
  static final DarkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: hSecondaryColor,
      backgroundColor: hWhiteColor,
      side: BorderSide(color: hSecondaryColor),
      padding: EdgeInsets.symmetric(vertical: hButtonHeight),
    ),);
}