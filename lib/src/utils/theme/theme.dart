import 'package:flutter/material.dart';
import 'package:homescout/src/utils/theme/widget_theme/elevated_button_theme.dart';
import 'package:homescout/src/utils/theme/widget_theme/outlined_button_theme.dart';
import 'package:homescout/src/utils/theme/widget_theme/text_theme.dart';

class HAppTheme{

  HAppTheme._();

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: HTextTheme.lightTextTheme,
      outlinedButtonTheme: HOutlinedButtonTheme.LightOutlinedButtonTheme,
      elevatedButtonTheme: HElevatedButtonTheme.LightElevatedButtonTheme,
  );
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: HTextTheme.darkTextTheme,
    outlinedButtonTheme: HOutlinedButtonTheme.DarkOutlinedButtonTheme,
    elevatedButtonTheme: HElevatedButtonTheme.DarkElevatedButtonTheme,
  );
}