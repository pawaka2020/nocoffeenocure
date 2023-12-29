import 'package:crypto/crypto.dart';
import 'package:nocoffeenocure/models/user.dart';
import 'package:objectbox/objectbox.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:convert' as convert;
//This is only for testing. Do NOT use this code later when a proper
//online backend is implemented, for security reasons.

//I just wanna see how it works first before I properly implement this
String secretKey = 'blahblahblah';

//creates a token that will be then decoded to a UserOB object representing a newly created user
String generateNewUserToken() {
  final Map<String, dynamic> payload = {
    //payloads in parallel with UserOB fields
    //all of them are actually nullable so only necessary ones are created
    "userId": '555557',
    "phoneNumber": "+60172520691",
    "guest": false,
    "newUser": false,
    //payloads in parallel of backlinks of UserOB(TBD)
    //other payloads
    "exp": DateTime.now().add(Duration(days: 1)).millisecondsSinceEpoch ~/ 1000,
    "iss": "your_server",
    "aud": "your_client",
  };
//asdasd
  final base64Header = base64Url.encode(utf8.encode('{"alg":"HS256","typ":"JWT"}'));
  final base64Payload = base64Url.encode(utf8.encode(json.encode(payload)));

  final signatureInput = '$base64Header.$base64Payload';
  final key = utf8.encode(secretKey);
  final List<int> signatureBytes = Hmac(sha256, key).convert(utf8.encode(signatureInput)).bytes;
  final base64Signature = base64Url.encode(signatureBytes);

  return '$base64Header.$base64Payload.$base64Signature';
}

UserOB? decodeToken(String token) {
  try {
    final parts = token.split('.');
    final payload = parts[1];
    final decodedPayload = base64Url.decode(payload);
    final decodedMap = jsonDecode(utf8.decode(decodedPayload));

    return UserOB()
      ..userId = decodedMap['userId'] as String?
      ..phoneNumber = decodedMap['phoneNumber'] as String?
      ..guest = decodedMap['guest'] as bool?
      ..newUser = decodedMap['newUser'] as bool?
      ..name = 'User'
      ..email = ''
      ..birthday = null
      ..address = ''
      ..profileImage = ''
      ..coins = 0
      ..isLoggedIn = true
    ;
  }
  catch (e) {
    print('Error decoding token: $e');
    return UserOB(); // Return a default user or handle the error as needed
  }
}

