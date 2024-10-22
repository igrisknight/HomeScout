import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:io';

void main() {
  runApp(SellPropertyApp());
}

class SellPropertyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sell Property',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SellPropertyScreen(),
    );
  }
}

class SellPropertyScreen extends StatefulWidget {
  @override
  _SellPropertyScreenState createState() => _SellPropertyScreenState();
}

class _SellPropertyScreenState extends State<SellPropertyScreen> {
  final _formKey = GlobalKey<FormState>();
  String _propertyTitle = '';
  String _description = '';
  double _price = 0.0;
  LatLng _location = LatLng(40.7128, -74.0060); // Default to New York
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  // Amenities Checkboxes
  List<String> amenities = ['Pool', 'Gym', 'Garage', 'Garden'];
  List<bool> _amenitiesSelection = [false, false, false, false];

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  void _submitProperty() {
    if (_formKey.currentState!.validate()) {
      // Collect selected amenities
      List<String> selectedAmenities = [];
      for (int i = 0; i < amenities.length; i++) {
        if (_amenitiesSelection[i]) {
          selectedAmenities.add(amenities[i]);
        }
      }

      // Process the property listing (send to backend)
      print('Property Title: $_propertyTitle');
      print('Description: $_description');
      print('Price: $_price');
      print('Location: $_location');
      print('Image: ${_imageFile?.path}');
      print('Amenities: $selectedAmenities'); // Updated line

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Property submitted successfully!')),
      );
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sell Property'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Property Title Input
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Property Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter property title';
                  }
                  return null;
                },
                onChanged: (value) {
                  _propertyTitle = value;
                },
              ),
              SizedBox(height: 10),

              // Description Input
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onChanged: (value) {
                  _description = value;
                },
              ),
              SizedBox(height: 10),

              // Price Input
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the price';
                  }
                  return null;
                },
                onChanged: (value) {
                  _price = double.tryParse(value) ?? 0.0;
                },
              ),
              SizedBox(height: 10),

              // Location Input
              Text('Location: ${_location.latitude}, ${_location.longitude}'),
              ElevatedButton(
                onPressed: () {
                  _showMapPicker();
                },
                child: Text('Select Location on Map'),
              ),
              SizedBox(height: 10),

              // Image Upload Button
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Upload Image'),
              ),
              if (_imageFile != null) ...[
                SizedBox(height: 10),
                Image.file(
                  File(_imageFile!.path),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ],
              SizedBox(height: 10),

              // Amenities Checkboxes
              Text('Amenities:'),
              ...List.generate(amenities.length, (index) {
                return CheckboxListTile(
                  title: Text(amenities[index]),
                  value: _amenitiesSelection[index],
                  onChanged: (value) {
                    setState(() {
                      _amenitiesSelection[index] = value!;
                    });
                  },
                );
              }),

              // Submit Button
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitProperty,
                child: Text('Submit Listing'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMapPicker() async {
    LatLng? selectedLocation = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapPickerScreen(
          currentLocation: _location,
        ),
      ),
    );
    if (selectedLocation != null) {
      setState(() {
        _location = selectedLocation;
      });
    }
  }
}

class MapPickerScreen extends StatelessWidget {
  final LatLng currentLocation;

  MapPickerScreen({required this.currentLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Location')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: currentLocation,
          zoom: 12,
        ),
        onTap: (LatLng location) {
          Navigator.pop(context, location);
        },
        markers: {
          Marker(
            markerId: MarkerId('selected-location'),
            position: currentLocation,
          ),
        },
      ),
    );
  }
}
