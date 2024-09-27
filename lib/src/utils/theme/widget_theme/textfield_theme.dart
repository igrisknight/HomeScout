import 'package:flutter/material.dart';
import 'package:homescout/src/constants/colors.dart';

class HTextFormFieldTheme {
  HTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
        border: OutlineInputBorder(),
        prefixIconColor: hSecondaryColor,
        floatingLabelStyle: TextStyle(color: hSecondaryColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: hSecondaryColor),
        )
      );

  static InputDecorationTheme darkInputDecorationTheme =
  const InputDecorationTheme(
      border: OutlineInputBorder(),
      prefixIconColor: hPrimaryColor,
      floatingLabelStyle: TextStyle(color: hPrimaryColor),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: hPrimaryColor),
      )
  );
}