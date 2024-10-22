import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(PostPropertyApp());
}

class PostPropertyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post Property',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PostPropertyScreen(),
    );
  }
}

class PostPropertyScreen extends StatefulWidget {
  @override
  _PostPropertyScreenState createState() => _PostPropertyScreenState();
}

class _PostPropertyScreenState extends State<PostPropertyScreen> {
  final _formKey = GlobalKey<FormState>();
  String _propertyTitle = '';
  String _description = '';
  double _price = 0.0;
  String _location = '';
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  void _previewListing() {
    if (_formKey.currentState!.validate()) {
      // Navigate to the preview screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewScreen(
            propertyTitle: _propertyTitle,
            description: _description,
            price: _price,
            location: _location,
            imageFile: _imageFile,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Property'),
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
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the location';
                  }
                  return null;
                },
                onChanged: (value) {
                  _location = value;
                },
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

              // Preview Button
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _previewListing,
                child: Text('Preview Listing'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PreviewScreen extends StatelessWidget {
  final String propertyTitle;
  final String description;
  final double price;
  final String location;
  final XFile? imageFile;

  PreviewScreen({
    required this.propertyTitle,
    required this.description,
    required this.price,
    required this.location,
    required this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview Listing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageFile != null)
              Image.file(
                File(imageFile!.path),
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 10),
            Text(
              propertyTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text('Location: $location'),
            SizedBox(height: 5),
            Text('Price: \$${price.toString()}'),
            SizedBox(height: 10),
            Text('Description:'),
            SizedBox(height: 5),
            Text(description),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to post the property (e.g., send to backend)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Property posted successfully!')),
                );
                Navigator.pop(context); // Go back after posting
              },
              child: Text('Post Property'),
            ),
          ],
        ),
      ),
    );
  }
}
