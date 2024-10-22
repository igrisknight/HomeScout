import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final String userName = "John Doe"; // Replace with actual user data
  final String userEmail = "john.doe@example.com"; // Replace with actual user data
  final String userPhone = "+1 234 567 890"; // Replace with actual user data
  final List<String> savedProperties = [
    "Luxury Apartment in Downtown",
    "Cozy Studio Near the Park",
    "Modern House in Suburbs",
    // Add more saved properties as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150'), // Placeholder image
              ),
            ),
            SizedBox(height: 20),

            // User Information
            Text(
              'Name: $userName',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Email: $userEmail',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Phone: $userPhone',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Saved Properties Title
            Text(
              'Saved Properties:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // List of Saved Properties
            Expanded(
              child: ListView.builder(
                itemCount: savedProperties.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(savedProperties[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Logic to remove property from saved properties
                          // Placeholder action: show a snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  '${savedProperties[index]} removed from saved properties'),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            // Edit Profile Button
            ElevatedButton(
              onPressed: () {
                // Logic to navigate to edit profile screen
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Edit Profile Button Pressed')),
                );
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
