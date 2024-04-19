import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:open_route_service/open_route_service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Widget buildDeliveryMap(LatLng _location, String address, List<LatLng> roadRoute) {
  LatLng bikeLocation = const LatLng(3.0492795, 101.6444132);

  Widget carrierLocation = MarkerLayer(
      markers: [
        Marker(
            width: 300,
            height: 300,
            point: bikeLocation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.motorcycle,
                  color: Colors.blue,
                  size: 30.0,
                ),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Eta: 13 min",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                    ),
                  ),
                )
              ],
            )
        )
      ]
  );

  Widget homeLocation = MarkerLayer(
      markers: [
        Marker(
            width: 300,
            height: 300,
            point: _location,
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
                        "Delivery Address",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        address,
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
  );

  Widget pathLayer = PolylineLayer(
    polylines: [
      Polyline(
        points: roadRoute,
        strokeWidth: 4.0,
        color: Colors.green,
      ),
    ],
  );

  return FlutterMap(
    options: MapOptions(
      initialCenter: bikeLocation,
      initialZoom: 18,
    ),
    children: [
      TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'com.example.nocoffeenocure',
      ),
      carrierLocation,
      homeLocation,
      pathLayer,
    ],
  );
}



