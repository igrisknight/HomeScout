import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homescout/src/features/core/controllers/property_controller.dart';
import 'package:homescout/src/features/core/screens/propertyListing/widgets/propertyCard.dart';

class PropertyListingScreen extends StatelessWidget {
  final PropertyController controller = Get.put(PropertyController());
  final TextEditingController searchController = TextEditingController();

  // Filter parameters
  String selectedLocation = 'All Locations';
  double minPrice = 0.0;
  double maxPrice = 1000000.0; // Example max price
  int selectedBedrooms = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Property Listings'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Optionally, implement search functionality here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search by location or property name',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                  },
                ),
              ),
              onChanged: (value) {
                // Update the controller's property list based on search input
                controller.filterProperties(value);
              },
            ),
          ),

          // Filters
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton<String>(
                  value: selectedLocation,
                  items: <String>['All Locations', 'Location 1', 'Location 2', 'Location 3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    selectedLocation = newValue!;
                    controller.filterPropertiesByLocation(selectedLocation);
                  },
                ),
                Slider(
                  min: 0,
                  max: maxPrice,
                  divisions: 10,
                  value: minPrice,
                  onChanged: (double value) {
                    minPrice = value;
                    controller.filterPropertiesByPrice(minPrice, maxPrice);
                  },
                  label: 'Min Price: \$${minPrice.toStringAsFixed(0)}',
                ),
                Slider(
                  min: 0,
                  max: maxPrice,
                  divisions: 10,
                  value: maxPrice,
                  onChanged: (double value) {
                    maxPrice = value;
                    controller.filterPropertiesByPrice(minPrice, maxPrice);
                  },
                  label: 'Max Price: \$${maxPrice.toStringAsFixed(0)}',
                ),
                DropdownButton<int>(
                  value: selectedBedrooms,
                  items: <int>[0, 1, 2, 3, 4, 5]
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text('$value Bedrooms'),
                    );
                  }).toList(),
                  onChanged: (int? newValue) {
                    selectedBedrooms = newValue!;
                    controller.filterPropertiesByBedrooms(selectedBedrooms);
                  },
                ),
              ],
            ),
          ),

          // Property List
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemCount: controller.filteredProperties.length,
                itemBuilder: (context, index) {
                  return PropertyCard(property: controller.filteredProperties[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
