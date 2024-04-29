import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../common.dart';

Future<void> sendEmail(String email) async {
  String url = onlineBackendURL + 'api/request_code';

  Map<String, dynamic> data = {
    'email': email,
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
      print('Email verification request successful: $email');
      // Handle response if needed
    }
    else {
      print('Error : ${response.statusCode}');
      // Handle error if needed
    }
  }
  catch (e) {
    print('Error: $e');
    // Handle error if needed
  }
}