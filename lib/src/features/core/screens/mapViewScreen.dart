import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() {
  runApp(MapViewApp());
}

class MapViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map View',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MapViewScreen(),
    );
  }
}

class MapViewScreen extends StatefulWidget {
  @override
  _MapViewScreenState createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  late GoogleMapController mapController;
  LatLng _currentLocation = LatLng(40.7128, -74.0060); // Default to New York
  final Location _locationService = Location();
  List<Property> properties = [
    Property(
      name: 'Luxury Apartment',
      location: LatLng(40.7128, -74.0060),
      description: 'A beautiful apartment in the heart of the city.',
    ),
    Property(
      name: 'Modern House',
      location: LatLng(40.73061, -73.935242),
      description: 'A modern house with all the amenities.',
    ),
    Property(
      name: 'Cozy Cottage',
      location: LatLng(40.6782, -73.9442),
      description: 'A cozy cottage for a weekend getaway.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Get current location of the user
  Future<void> _getCurrentLocation() async {
    final currentLocation = await _locationService.getLocation();
    setState(() {
      _currentLocation = LatLng(currentLocation.latitude!, currentLocation.longitude!);
    });
  }

  // Marker tap callback
  void _onMarkerTapped(Property property) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(property.name),
          content: Text(property.description),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Add markers to the map
  Set<Marker> _createMarkers() {
    return properties.map((property) {
      return Marker(
        markerId: MarkerId(property.name),
        position: property.location,
        infoWindow: InfoWindow(
          title: property.name,
          snippet: property.description,
        ),
        onTap: () => _onMarkerTapped(property),
      );
    }).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map View'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: _currentLocation,
          zoom: 12,
        ),
        markers: _createMarkers(),
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.my_location),
            onPressed: () {
              mapController.animateCamera(CameraUpdate.newLatLng(_currentLocation));
            },
          ),
        ],
      ),
    );
  }
}

class Property {
  final String name;
  final LatLng location;
  final String description;

  Property({
    required this.name,
    required this.location,
    required this.description,
  });
}
