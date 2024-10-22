import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homescout/src/features/core/controllers/home_controller.dart';
import 'package:homescout/src/features/core/screens/dashboard/dashboard.dart';


class HomeView extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Real Estate Home'),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Handle notifications
              },
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                // Handle messages
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search properties by location, price, type",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onSubmitted: (value) {
                    // Search functionality
                  },
                ),
                SizedBox(height: 16),

                // Featured Properties
                Text('Featured Properties', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Obx(() {
                  return homeController.featuredProperties.isEmpty
                      ? Text("No Featured Properties")
                      : Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeController.featuredProperties.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Container(
                            width: 150,
                            child: Column(
                              children: [
                                Image.network('https://via.placeholder.com/150'),
                                Text(homeController.featuredProperties[index]),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),

                SizedBox(height: 16),

                // Popular Locations
                Text('Popular Locations', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Obx(() {
                  return homeController.popularLocations.isEmpty
                      ? Text("No Popular Locations")
                      : Wrap(
                    spacing: 8,
                    children: homeController.popularLocations.map((location) {
                      return Chip(label: Text(location));
                    }).toList(),
                  );
                }),

                SizedBox(height: 16),

                // Recent Searches
                Text('Recent Searches', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Obx(() {
                  return homeController.recentSearches.isEmpty
                      ? Text("No Recent Searches")
                      : Wrap(
                    spacing: 8,
                    children: homeController.recentSearches.map((search) {
                      return Chip(label: Text(search));
                    }).toList(),
                  );
                }),

                SizedBox(height: 16),

                // Navigation to Dashboard Button
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to the Dashboard using GetX
                    Get.to(() => Dashboard());
                  },
                  icon: Icon(Icons.dashboard),
                  label: Text('Go to Dashboard'),
                ),

                SizedBox(height: 16),

                // Other buttons (if needed)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
