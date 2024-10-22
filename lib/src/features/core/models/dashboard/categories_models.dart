import 'package:flutter/material.dart';

class DashBoardCategoriesModels{
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashBoardCategoriesModels(this.title, this.heading, this.subHeading, this.onPress);

  static List<DashBoardCategoriesModels> list = [
    DashBoardCategoriesModels("A", "Apartment", "", null),
    DashBoardCategoriesModels("V", "Villas", "", null),
    DashBoardCategoriesModels("C", "Commercial", "", null),
    DashBoardCategoriesModels("P", "Plots", "", null)
  ];
}