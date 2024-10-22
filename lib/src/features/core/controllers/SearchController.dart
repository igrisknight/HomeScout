import 'package:get/get.dart';
import 'package:homescout/src/features/core/models/property_model.dart';

class Search_Controller extends GetxController {
  var searchQuery = ''.obs;
  var propertyTypes = ["Apartment", "Villa", "Commercial"].obs;
  var selectedPropertyType = ''.obs;
  var properties = <Property>[].obs; // Replace with your Property model
  var isMapView = false.obs;
  var minPrice = 0.obs;
  var maxPrice = 1000000.obs;

  void updateSearch(String query) {
    searchQuery.value = query;
    // Call search method to fetch properties based on the query
  }

  void updatePropertyType(String type) {
    selectedPropertyType.value = type;
    // Call method to filter properties by type
  }

  void toggleView() {
    isMapView.value = !isMapView.value;
  }
}
