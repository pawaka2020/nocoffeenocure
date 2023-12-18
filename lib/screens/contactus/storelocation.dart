import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:nocoffeenocure/screens/order/pickupmap.dart';
import '../../common.dart';
import 'package:http/http.dart' as http;

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

class StoreLocationScreen extends StatefulWidget {
  final String address = 'COFFEE FANS SDN BHD (M) C-02-10, Ten Kinrara, Jalan BK 5a/3a, Bandar Kinrara, 47180 Puchong, Selangor';


  @override
  State<StatefulWidget> createState() => _StoreLocationState();
}

class _StoreLocationState extends State<StoreLocationScreen> {

  LatLng? _location;

  Future<void> _loadLocation() async {
    LatLng? coordinates = await addressToLatLng(widget.address);
    if (coordinates != null) {
      setState(() {
        print("Coordinate fetching successful");
        _location = coordinates;
      });
    }
    else {
      print("Error: failed to get coordinates for the address: ${widget.address}");
    }
  }

  @override
  void initState() {
    super.initState();
    _loadLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (_location != null)
            FlutterMap(
              options: MapOptions(
                initialCenter: _location!,
                initialZoom: 18,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.nocoffeenocure',
                ),
                MarkerLayer(
                    markers: [
                      Marker(
                          width: 300,
                          height: 300,
                          point: _location!,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 30.0,
                              ),
                              SizedBox(height: 5),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "No Coffee No Cure",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "COFFEE FANS SDN BHD (M) C-02-10, Ten Kinrara, Jalan BK 5a/3a, Bandar Kinrara, 47180 Puchong, Selangor",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                      )
                    ]
                )
              ],
            )
          else
            loading
        ],
      )
    );
  }
}

Container loading = Container(
  color: Colors.white,
  child: Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
    ),
  ),
);

