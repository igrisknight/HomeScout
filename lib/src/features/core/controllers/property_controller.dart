import 'package:get/get.dart';
import 'package:homescout/src/features/core/models/property_model.dart';

class PropertyController extends GetxController {
  var properties = <Property>[].obs;
  var filteredProperties = <Property>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProperties();
    super.onInit();
  }

  void fetchProperties() async {
    // Fetch properties from API or local source
    // Example data fetching
    // properties.value = await fetchData();
    filteredProperties.value = properties; // Initially show all properties
    isLoading.value = false;
  }

  void filterProperties(String query) {
    if (query.isEmpty) {
      filteredProperties.value = properties;
    } else {
      filteredProperties.value = properties.where((property) {
        return property.title.toLowerCase().contains(query.toLowerCase()) ||
            property.location.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }

  void filterPropertiesByLocation(String location) {
    // Add filtering logic based on location
  }

  void filterPropertiesByPrice(double minPrice, double maxPrice) {
    // Add filtering logic based on price range
    filteredProperties.value = properties.where((property) {
      return property.price >= minPrice && property.price <= maxPrice;
    }).toList();
  }

  void filterPropertiesByBedrooms(int bedrooms) {
    // Add filtering logic based on number of bedrooms
  }
}
