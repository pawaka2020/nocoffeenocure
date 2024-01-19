import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import '../../common.dart';
import '../contactus/storelocation.dart';
import 'dart:convert';
import 'dart:async';

bool checkTracking(bool tracking)  {
  if (tracking == true) {
    printToast("Error: Order already exists");
    return false;
  }
    return true;
}

Future<bool> checkAddress(String address, bool onSitePickup) async {
  if (onSitePickup) return true;
  bool result = true;
  final apiUrl =
      'https://nominatim.openstreetmap.org/search?format=json&q=$address&countrycodes=MY';
  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<String> addresses = data.map((result) => result['display_name'] as String).toList();
      if (addresses.isEmpty) {
        printToast("Error: invalid address");
        return false;
      }
      else {
        return true;
      }
    }
    else {
      printToast("Error: address checking failed");
      return false;
    }
  } catch (e) {
    throw Exception('Error: $e');
    return false;
  }
  return result;
}

Future<bool> checkOrderErrors(bool tracking, String address, bool onSitePickup) async {
  bool result = true;
  result = checkTracking(tracking);
  result = await checkAddress(address, onSitePickup);
  return result;
}