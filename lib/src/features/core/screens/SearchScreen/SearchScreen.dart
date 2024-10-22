import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homescout/src/features/core/controllers/SearchController.dart';
import 'package:homescout/src/features/core/screens/PropertyDetailScreen.dart';


class SearchScreen extends StatelessWidget {
  final controller = Get.put(Search_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Property Search"),
      ),
      body: Column(
        children: [
          // Search Bar
          _buildSearchBar(),
          // Filters
          _buildFilters(),
          // Map Toggle
          _buildMapToggle(),
          // Property List View
          Expanded(child: _buildPropertyList()),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      onChanged: (value) => controller.updateSearch(value),
      decoration: InputDecoration(
        hintText: 'Search for properties...',
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // Trigger search action
          },
        ),
      ),
    );
  }

  Widget _buildFilters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Dropdown for Property Type
        DropdownButton(
          items: controller.propertyTypes.map((type) {
            return DropdownMenuItem(
              child: Text(type),
              value: type,
            );
          }).toList(),
          onChanged: (value) => controller.updatePropertyType(value!),
          hint: Text("Property Type"),
        ),
        // Price Range
        Row(
          children: [
            Text("\$${controller.minPrice} - \$${controller.maxPrice}"),
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                // Open price range dialog
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMapToggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("List View"),
        Obx(() => Switch(
          value: controller.isMapView.value,
          onChanged: (value) {
            controller.toggleView();
          },
        )),
        Text("Map View"),
      ],
    );
  }

  Widget _buildPropertyList() {
    return Obx(() {
      if (controller.properties.isEmpty) {
        return Center(child: Text("No Results Found"));
      }
      return ListView.builder(
        itemCount: controller.properties.length,
        itemBuilder: (context, index) {
          return _buildPropertyCard(controller.properties[index]);
        },
      );
    });
  }

  Widget _buildPropertyCard(property_model.Property property) {
    return Card(
      child: ListTile(
        title: Text(property.title),
        subtitle: Text("\$${property.price} - ${property.location}"),
        onTap: () {
          Get.to(() => PropertyDetailScreen(property: property)); // Navigates to PropertyDetailScreen
        },
      ),
    );
  }

}
