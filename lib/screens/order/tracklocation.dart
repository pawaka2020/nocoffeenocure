import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:nocoffeenocure/screens/order/pickupmap.dart';
import '../../common.dart';
import 'deliverymap.dart';
import 'package:http/http.dart' as http;

Future<List<LatLng>> _loadUserCurrentLocation() async {
  try {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      // Handle the case where the user denied or permanently denied location access.
      print('Location permission denied.');
      return [];
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return [LatLng(position.latitude, position.longitude)];
  }
  catch (e) {
    print('Error getting location: $e');
    return [];
  }
}

Future<LatLng?> addressToLatLng(String address) async {
  try {
    List<Location> locations = await locationFromAddress(address);
    if (locations.isNotEmpty) {
      print("latitude = ${locations.first.latitude}, longitude = ${locations.first.longitude}");
      return LatLng(locations.first.latitude, locations.first.longitude);
    }
  } catch (e) {
    print('Error: ${e.toString()}');
  }
  return null;
}

Future<List<LatLng>> fetchRoute(LatLng start, LatLng end) async {
  String apikey = '5b3ce3597851110001cf6248456c4d76701e43d2ad85859108f86ed5';
  final response = await http.get(
    Uri.parse('https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apikey&start=${start.longitude},${start.latitude}&end=${end.longitude},${end.latitude}'),
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    var coordinates = data['features'][0]['geometry']['coordinates'] as List;
    return coordinates.map((coordinate) => LatLng(coordinate[1], coordinate[0])).toList();
  }
  else {
    throw Exception('Failed to load route');
  }
}

class TrackLocationScreen extends StatefulWidget {
  final String address = 'COFFEE FANS SDN BHD (M) C-02-10, Ten Kinrara, Jalan BK 5a/3a, Bandar Kinrara, 47180 Puchong, Selangor';
  bool onSitePickup;
  String deliveryAddress;
  TrackLocationScreen(this.onSitePickup, this.deliveryAddress);
  @override
  State<StatefulWidget> createState() => TrackLocationState();
}

class TrackLocationState extends State<TrackLocationScreen> {
  LatLng? _location;
  List<LatLng> roadRoute = [];
  LatLng _location2 = const LatLng(3.0492795, 101.6444132);
  late LatLng _userLocation;

  @override
  void initState() {
    super.initState();
    _loadLocation();
  }

  Future<void> _loadRoadPath(LatLng location1, LatLng location2) async {
    if (widget.onSitePickup == false && _location != null) {
      List<LatLng?> _roadRoute = await fetchRoute(location1, location2);
      setState(() {
        roadRoute = _roadRoute.cast<LatLng>();
        print("first route = ${roadRoute[0].latitude}");// Cast to LatLng type
      });
    }
  }

  Future<void> _loadUserLocation() async {
    if (widget.onSitePickup == true)
      final userLocation = _loadUserCurrentLocation();
      setState((){
        _loadLocation();
      });
  }

  Future<void> _loadLocation() async {
    LatLng? coordinates = await addressToLatLng(widget.deliveryAddress);
    if (coordinates != null) {
      setState(() {
        _location = coordinates;
        // Call _loadRoadPath here to ensure it's executed after _loadLocation
        _loadRoadPath(_location!, _location2);
      });
    }
    else {
      print("Error: failed to get coordinates for the address: ${widget.address}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Location',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          if (_location != null && widget.onSitePickup == true)
            buildPickupMap(_location!, widget.deliveryAddress)
          else if (_location != null && widget.onSitePickup == false)
            buildDeliveryMap(_location!, widget.deliveryAddress, roadRoute)
          else
            loading
        ],
      ),
    );
  }
}

Center loading = Center(
  child: CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
  ),
);
