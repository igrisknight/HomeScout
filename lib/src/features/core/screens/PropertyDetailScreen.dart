import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:homescout/src/features/core/screens/propertydetailscreen.dart';

void main() {
  runApp(PropertyDetailsApp());
}

class PropertyDetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property Details',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PropertyDetailsScreen(),
    );
  }
}

abstract class PropertyDetailScreen extends StatelessWidget {
  final Property property = Property(
    images: [
      'https://via.placeholder.com/300x200',
      'https://via.placeholder.com/300x200?text=Image+2',
      'https://via.placeholder.com/300x200?text=Image+3',
    ],
    title: 'Luxury Apartment',
    price: '\$250,000',
    location: 'New York, NY',
    description: 'A beautiful apartment in the heart of the city.',
    amenities: ['Pool', 'Gym', 'Garage', 'Garden'],
    contactInfo: 'Phone: (123) 456-7890\nEmail: info@example.com',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(property.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Carousel
            Container(
              height: 200,
              child: PageView.builder(
                itemCount: property.images.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    property.images[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            // Property Information
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.price,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.red),
                      SizedBox(width: 4),
                      InkWell(
                        onTap: () {
                          // Implement map link functionality
                        },
                        child: Text(
                          property.location,
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    property.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Amenities:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ...property.amenities.map((amenity) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text('• $amenity', style: TextStyle(fontSize: 16)),
                    );
                  }).toList(),
                  SizedBox(height: 10),
                  Text(
                    'Contact Information:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(property.contactInfo, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 20),
                  // Contact, Save, and Share Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Implement contact functionality
                        },
                        child: Text('Contact'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Implement save functionality
                        },
                        child: Text('Save'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Implement share functionality
                        },
                        child: Text('Share'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Property {
  final List<String> images;
  final String title;
  final String price;
  final String location;
  final String description;
  final List<String> amenities;
  final String contactInfo;

  Property({
    required this.images,
    required this.title,
    required this.price,
    required this.location,
    required this.description,
    required this.amenities,
    required this.contactInfo,
  });
}
