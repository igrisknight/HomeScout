import 'package:get/get.dart';

class HomeController extends GetxController {
  var featuredProperties = [].obs;
  var popularLocations = [].obs;
  var recentSearches = [].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch initial data
    fetchFeaturedProperties();
    fetchPopularLocations();
    fetchRecentSearches();
  }

  void fetchFeaturedProperties() {
    // Fetch the featured properties from the API
    featuredProperties.value = ["Property 1", "Property 2", "Property 3"];
  }

  void fetchPopularLocations() {
    // Fetch the popular locations from the API
    popularLocations.value = ["Location 1", "Location 2", "Location 3"];
  }

  void fetchRecentSearches() {
    // Fetch recent searches data
    recentSearches.value = ["Search 1", "Search 2", "Search 3"];
  }

// Other logic for navigation and interaction
}
