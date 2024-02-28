import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../common.dart';

Future<void> verifyCode(String enteredCode, String phoneNumber) async {
  String url = onlineBackendURL + 'api/verify_code';
  Map<String, dynamic> data = {
    'phone_number': phoneNumber,
    'entered_code' : enteredCode,
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      body: json.encode(data), // Encode the data as JSON
      headers: <String, String>{
        'Content-Type': 'application/json', // Set content type header
      },
    );
    if (response.statusCode == 200) {
      print('Verification code sent successfully: $enteredCode, $phoneNumber');
      // Handle response if needed
    } else {
      print('Failed to send verification code: ${response.statusCode}');
      // Handle error if needed
    }
  }
  catch (e) {
    print('Error sending verification code: $e');
  }
}
