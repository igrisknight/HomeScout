import 'package:flutter/material.dart';

void main() {
  runApp(RentPropertyApp());
}

class RentPropertyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rent Property',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RentPropertyScreen(),
    );
  }
}

class RentPropertyScreen extends StatefulWidget {
  @override
  _RentPropertyScreenState createState() => _RentPropertyScreenState();
}

class _RentPropertyScreenState extends State<RentPropertyScreen> {
  final List<Property> properties = [
    Property(
      title: "Luxury Apartment in Downtown",
      location: "123 Main St, New York",
      price: 2500,
      description: "A beautiful apartment with modern amenities.",
      contact: "123-456-7890",
    ),
    Property(
      title: "Cozy Studio Near the Park",
      location: "456 Park Ave, New York",
      price: 1800,
      description: "A cozy studio with park views.",
      contact: "987-654-3210",
    ),
    // Add more properties as needed
  ];

  final _formKey = GlobalKey<FormState>();
  String _inquiryMessage = '';

  void _submitInquiry(String contact) {
    if (_formKey.currentState!.validate()) {
      // Process the inquiry (send to backend)
      print('Inquiry sent to: $contact');
      print('Message: $_inquiryMessage');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Inquiry submitted successfully!')),
      );

      // Reset the form
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rent Property'),
      ),
      body: ListView.builder(
        itemCount: properties.length,
        itemBuilder: (context, index) {
          final property = properties[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text('Location: ${property.location}'),
                  SizedBox(height: 5),
                  Text('\$${property.price}/month', style: TextStyle(color: Colors.green)),
                  SizedBox(height: 10),
                  Text(property.description),
                  SizedBox(height: 10),
                  Text('Contact: ${property.contact}'),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _showInquiryForm(property.contact),
                    child: Text('Inquire'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showInquiryForm(String contact) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Inquiry Form'),
          content: Form(
            key: _formKey,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Your Message',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a message';
                }
                return null;
              },
              onChanged: (value) {
                _inquiryMessage = value;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _submitInquiry(contact);
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Submit'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

class Property {
  final String title;
  final String location;
  final double price;
  final String description;
  final String contact;

  Property({
    required this.title,
    required this.location,
    required this.price,
    required this.description,
    required this.contact,
  });
}
