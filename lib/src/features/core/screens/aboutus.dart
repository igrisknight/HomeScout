import 'package:flutter/material.dart';

void main() {
  runApp(AboutUsApp());
}

class AboutUsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About Us',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AboutUsScreen(),
    );
  }
}

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Our Company',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We are a leading company in the real estate market. Our mission is to provide the best service to our customers.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Meet Our Team',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Our team consists of experienced professionals dedicated to helping you with your real estate needs.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Follow Us',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Logic to open social media link (e.g., Facebook)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Open Facebook')),
                    );
                  },
                  child: Text('Facebook'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Logic to open social media link (e.g., Twitter)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Open Twitter')),
                    );
                  },
                  child: Text('Twitter'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Logic to open social media link (e.g., Instagram)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Open Instagram')),
                    );
                  },
                  child: Text('Instagram'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
