import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

//Light and Dark Elevated Button theme//
class HOutlinedButtonTheme {
  HOutlinedButtonTheme._();

  //light theme//
  static final LightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: hSecondaryColor,
      side: BorderSide(color: hSecondaryColor),
      padding: EdgeInsets.symmetric(vertical: hButtonHeight),
      elevation: 5,
    ),
  );

  //dark theme//
  static final DarkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: hWhiteColor,
      side: BorderSide(color: hWhiteColor),
      padding: EdgeInsets.symmetric(vertical: hButtonHeight),
    ),
  );
}