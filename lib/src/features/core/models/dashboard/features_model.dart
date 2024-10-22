import 'package:flutter/material.dart';
import 'package:homescout/src/constants/image_string.dart';

class DashBoardFeaturesModels{
  final String title;
  final String heading;
  final String subHeading;
  final String imagePath;
  final VoidCallback? onPress;

  DashBoardFeaturesModels(this.title, this.heading, this.subHeading, this.imagePath, this.onPress);

  static List<DashBoardFeaturesModels> list = [
    DashBoardFeaturesModels("Affordable Apartments\nNear You", "3BHK Apartments", "Prime Location","assets/images/dashboard/hotproperty.jpg", null),
    DashBoardFeaturesModels("Dreamy Villa", "Villas", "Prime Location", "assets/images/dashboard/villa.jfif", null),
    DashBoardFeaturesModels("Spacious\nCommercials", "Commercial", "Prime Location", "assets/images/dashboard/commercial.jfif", null),
    DashBoardFeaturesModels("Hot Plots\nNear You", "Plots", "Prime Location", "assets/images/dashboard/plots.jfif", null)
  ];
}