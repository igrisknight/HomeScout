import 'package:flutter/material.dart';
import 'package:homescout/src/constants/colors.dart';
import 'package:homescout/src/constants/image_string.dart';
import 'package:homescout/src/constants/sizes.dart';
import 'package:homescout/src/constants/text_string.dart';
import 'package:homescout/src/features/core/screens/dashboard/widgets/appBar.dart';
import 'package:homescout/src/features/core/screens/dashboard/widgets/banner.dart';
import 'package:homescout/src/features/core/screens/dashboard/widgets/categories.dart';
import 'package:homescout/src/features/core/screens/dashboard/widgets/search.dart';
import 'package:homescout/src/features/core/screens/dashboard/widgets/top_features.dart';
import 'package:get/get.dart';  // Import GetX for navigation
import 'package:homescout/src/features/core/screens/SearchScreen/SearchScreen.dart'; // Ensure correct import path

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Variable
    final txtTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate back to Home Page
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(hDashboardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Heading
                Text(hDashBoardTitle, style: txtTheme.displayLarge),
                SizedBox(height: 10),
                Text(hDashBoardHeading, style: txtTheme.displayLarge),
                const SizedBox(
                  height: hDashboardPadding,
                ),
                // Search box
                DashBoardSearchBox(
                  txtTheme: txtTheme,
                  onPressed: () {
                    // Navigate to SearchScreen using GetX
                    Get.to(() => SearchScreen());
                  },
                ),
                const SizedBox(
                  height: hDashboardPadding + 10,
                ),
                // Categories
                DashBoardCategories(txtTheme: txtTheme),
                const SizedBox(
                  height: hDashboardPadding + 10,
                ),
                // Banners
                DashBoardBanner(txtTheme: txtTheme),
                const SizedBox(
                  height: hDashboardPadding + 10,
                ),
                // Featured listing
                Text(
                  hDashBoardFeaturedListing,
                  style: txtTheme.headlineMedium?.apply(fontSizeFactor: 1.2),
                ),
                DashBoardFeatures(txtTheme: txtTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
