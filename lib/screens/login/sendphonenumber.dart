import 'package:http/http.dart' as http;

Future<void> sendPhoneNumber(String phoneNumber) async {
  // Your Flask backend URL
  String url = 'https://your-flask-backend.com/api/verify';

  // Data to send to Flask backend
  Map<String, dynamic> data = {
    'phone_number': phoneNumber,
  };

  try {
    // Send POST request
    final response = await http.post(
      Uri.parse(url),
      body: data,
    );

    if (response.statusCode == 200) {
      print('Phone number sent successfully');
      // Handle response if needed
    } else {
      print('Failed to send phone number: ${response.statusCode}');
      // Handle error if needed
    }
  } catch (e) {
    print('Error sending phone number: $e');
    // Handle error if needed
  }
}
