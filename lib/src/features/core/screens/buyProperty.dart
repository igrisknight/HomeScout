import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(BuyPropertyApp());
}

class BuyPropertyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buy Property',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BuyPropertyScreen(),
    );
  }
}

class BuyPropertyScreen extends StatefulWidget {
  @override
  _BuyPropertyScreenState createState() => _BuyPropertyScreenState();
}

class _BuyPropertyScreenState extends State<BuyPropertyScreen> {
  double _currentPriceRange = 500000; // Default price range
  List<Property> properties = [
    Property(name: 'Luxury Apartment', price: 250000),
    Property(name: 'Modern House', price: 450000),
    Property(name: 'Cozy Cottage', price: 300000),
    Property(name: 'City Center Studio', price: 200000),
  ];
  List<Property> filteredProperties = [];

  @override
  void initState() {
    super.initState();
    filteredProperties = properties;
  }

  void _filterProperties(double price) {
    setState(() {
      filteredProperties = properties.where((property) => property.price <= price).toList();
    });
  }

  void _contactSeller(String propertyName) {
    // Implement call/message functionality
    print('Contacting seller for $propertyName');
  }

  final _inquiryFormKey = GlobalKey<FormState>();
  String _inquiryText = '';

  void _submitInquiry() {
    if (_inquiryFormKey.currentState!.validate()) {
      // Process the inquiry (e.g., send to backend)
      print('Inquiry submitted: $_inquiryText');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Inquiry submitted successfully!')),
      );
      _inquiryFormKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Property'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Price Range Slider
            Text(
              'Price Range: \$${_currentPriceRange.toStringAsFixed(0)}',
              style: TextStyle(fontSize: 16),
            ),
            Slider(
              value: _currentPriceRange,
              min: 100000,
              max: 1000000,
              divisions: 10,
              label: '\$${_currentPriceRange.toStringAsFixed(0)}',
              onChanged: (value) {
                setState(() {
                  _currentPriceRange = value;
                  _filterProperties(value);
                });
              },
            ),
            SizedBox(height: 20),

            // Property Selection
            Text(
              'Available Properties:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredProperties.length,
                itemBuilder: (context, index) {
                  final property = filteredProperties[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(property.name),
                      subtitle: Text('\$${property.price.toString()}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.call),
                            onPressed: () => _contactSeller(property.name),
                          ),
                          IconButton(
                            icon: Icon(Icons.message),
                            onPressed: () => _contactSeller(property.name),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Inquiry Form
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Inquiry Form:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Form(
              key: _inquiryFormKey,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Your Inquiry',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your inquiry';
                  }
                  return null;
                },
                onChanged: (value) {
                  _inquiryText = value;
                },
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _submitInquiry,
              child: Text('Submit Inquiry'),
            ),
          ],
        ),
      ),
    );
  }
}

class Property {
  final String name;
  final double price;

  Property({
    required this.name,
    required this.price,
  });
}
