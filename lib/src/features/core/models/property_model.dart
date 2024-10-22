class ContactInfo {
  final String phone;
  final String email;

  ContactInfo({required this.phone, required this.email});
}

class Property {
  final String id;
  final String title;
  final String location;
  final double price;
  final String description;
  final List<String> imageUrls; // New field for images
  final List<String> amenities; // New field for amenities
  final ContactInfo contactInfo; // New field for contact info

  Property({
    required this.id,
    required this.title,
    required this.location,
    required this.price,
    required this.description,
    required this.imageUrls,
    required this.amenities,
    required this.contactInfo,
  });
}
