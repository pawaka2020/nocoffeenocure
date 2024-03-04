import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../common.dart';

Future<void> sendPhoneNumber(String phoneNumber) async {
  String url = onlineBackendURL + 'api/verify';
  Map<String, dynamic> data = {
    'phone_number': phoneNumber,
  };
  try {
    final response = await http.post(
      Uri.parse(url),
      body: json.encode(data), // Encode the data as JSON
      headers: <String, String> {
        'Content-Type': 'application/json', // Set content type header
      },
    );
    if (response.statusCode == 200) {
      print('Phone number sent successfully: $phoneNumber');
      // Handle response if needed
    }
    else {
      print('Failed to send phone number: ${response.statusCode}');
      // Handle error if needed
    }
  }
  catch (e) {
    print('Error sending phone number: $e');
    // Handle error if needed
  }
}