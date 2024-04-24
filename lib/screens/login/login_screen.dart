import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nocoffeenocure/screens/login/sendemail.dart';
import 'package:nocoffeenocure/screens/login/sendphonenumber.dart';
//import 'package:nocoffeenocure/screens/verification/verification_screen.dart';
import '../../common.dart';
import '../../repos/user.dart';
import '../../widgets/partial_divider.dart';
import '../login/buildverificationcodeboxes.dart';
import '../login/buildtimedisplay.dart';
import '../login/builddisclaimertext.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//Future<void> sendEmail(String email) async {
//   String url = onlineBackendURL + 'api/verify_email';

// Future<void> verifyCode(String enteredCode, String email) async {
//   String url = onlineBackendURL + 'api/verify_email_code';

enum AuthStage {
  login,
  verification,
}

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var authStage = AuthStage.login;

  String _phoneNumber = '';
  void updatePhoneNumber(String phoneNumber) {
    setState(() {
      _phoneNumber = phoneNumber;
    });
    //_phoneNumber = phoneNumber;
  }

  String _email = '';
  void updateEmail(String email) {
    // setState(() {
    //   _phoneNumber = phoneNumber;
    // });
    _email = email;
  }

  String _enteredCode = '';
  void setEnteredCode(String enteredCode) {
    _enteredCode = enteredCode;
  }

  void getVerificationCode() async {
    // if (_phoneNumber.length > 11 || _phoneNumber.length < 10)
    //   printToast("Error : phone number must be 10 or 11 characters.");
    // else {
    //   try {
    //     await sendPhoneNumber(_phoneNumber);
    //     setState(() {
    //       authStage = AuthStage.verification;
    //     });
    //   }
    //   catch (e) {
    //     print('Error getting verification code: $e');
    //   }
    // }

    // setState(() {
    //   authStage = AuthStage.verification;
    // });

    try {
      await sendEmail(_email);
      setState(() {
        authStage = AuthStage.verification;
      });
    }
    catch (e) {
      print('Error: $e');
    }
  }

  Future<void> verifyCode(String enteredCode, String email) async {
    //String url = onlineBackendURL + 'api/verify_email_code';
    String url = onlineBackendURL + 'api/verify_code';

    Map<String, dynamic> data = {
      'email': email ?? '',
      'entered_code' : enteredCode ?? 0,
    };
    // try {
    //
    // }
    // catch (e) {
    //   print('Error sending verification code: $e');
    // }
    final response = await http.post(
      Uri.parse(url),
      body: json.encode(data), // Encode the data as JSON
      headers: <String, String> {
        'Content-Type': 'application/json', // Set content type header
      },
    );
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final authToken = jsonResponse['auth_token'];
      UserRepo().loginUserBackend(authToken);
      UserRepo().storeProfileImage2();
      printToast("Login successful");
      Navigator.of(context).pop(true);
    }
    else if (response.statusCode == 400)  {
      printToast('Error: verification code incorrect');
      // Handle error if needed
    }
    else {
      printToast("ERROR: ERROR");
    }
  }

  Widget loginEmailUI() => ListView(
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Column(
              children: [
                Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.asset(
                      'assets/images/ncnclogo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                //buildPhoneNumber(_phoneNumber, updatePhoneNumber),
                buildEmailField(_email, updateEmail),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    getVerificationCode();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Get Verification Code",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 133), //135
              ],
            )
        ),
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 100), //change this '50' to a height value that fills the rest of the unoccupied screen's height
          painter: SlopedHillPainter(),
        ),
      ]
  );

  Widget verificationUI() => Padding(
      padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: ListView(children: [
        Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.asset(
              'assets/images/ncnclogo.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 24),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Please enter the 4-digit verification code we sent to your email address\n${_email}",
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(height: 24),
        buildVerificationCodeBoxes(context, setEnteredCode), //save the input value to verificationCode
        SizedBox(height: 12), //24
        ElevatedButton(
          onPressed: () {
            print("code entered = $_enteredCode, email entered = $_email");
            verifyCode(_enteredCode, _email);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Container(
            width: double.infinity,
            child: Center(
              child: Text(
                "Submit Code",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Divider(),
        SizedBox(height: 12),
        buildTimerDisplay(),
        SizedBox(height: 25),
        buildDisclaimerText(context),
      ])
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Log in or Sign up',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: (authStage == AuthStage.login)? loginEmailUI() : verificationUI()
    );
  }
}

Widget buildPhoneNumber(String phoneNumber, Function(String) onPhoneNumberChanged) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Phone Number",
        style: TextStyle(fontSize: 14),
      ),
      SizedBox(height: 8),
      Row(
        children: [
          Text(
            "+60",
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              onChanged: onPhoneNumberChanged,
              style: TextStyle(fontSize: 14, color: Colors.black),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(11), // Adjust the limit as needed
              ],
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                hintText: 'Eg. 0193446789',
                hintStyle: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget buildEmailField(String email, Function(String) onEmailChanged) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Email Address",
        style: TextStyle(fontSize: 14),
      ),
      SizedBox(height: 8),
      TextFormField(
        onChanged: onEmailChanged,
        style: TextStyle(fontSize: 14, color: Colors.black),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          hintText: 'Eg. john.doe@example.com',
          hintStyle: TextStyle(fontSize: 12),
        ),
      ),
    ],
  );
}


class SlopedHillPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.orange; // Color of the hill
    Path path = Path();
    path.lineTo(0, size.height * 1); // Starting point at the bottom left
    path.lineTo(size.width, size.height * 1); // Bottom right
    path.lineTo(size.width, 0); // Top right
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.9, 0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// class _LoginScreenState2 extends State<LoginScreen> {
//
//   var authStage = AuthStage.login;
//
//   String _phoneNumber = '';
//   void updatePhoneNumber(String phoneNumber) {
//     setState(() {
//       _phoneNumber = phoneNumber;
//     });
//     //_phoneNumber = phoneNumber;
//   }
//
//   String _enteredCode = '';
//   void setEnteredCode(String enteredCode) {
//     _enteredCode = enteredCode;
//   }
//
//   void getVerificationCode() async {
//     if (_phoneNumber.length > 11 || _phoneNumber.length < 10)
//       printToast("Error : phone number must be 10 or 11 characters.");
//     else {
//       try {
//         await sendPhoneNumber(_phoneNumber);
//         Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) => VerificationScreen(_phoneNumber),
//         ));
//       }
//       catch (e) {
//         print('Error getting verification code: $e');
//       }
//     }
//   }
//
//   Widget buildPhoneNumber(String phoneNumber, Function(String) onPhoneNumberChanged) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Phone Number",
//           style: TextStyle(fontSize: 14),
//         ),
//         SizedBox(height: 8),
//         Row(
//           children: [
//             Text(
//               "+60",
//               style: TextStyle(fontSize: 12),
//             ),
//             SizedBox(width: 8),
//             Expanded(
//               child: TextFormField(
//                 onChanged: onPhoneNumberChanged,
//                 style: TextStyle(fontSize: 14, color: Colors.black),
//                 keyboardType: TextInputType.phone,
//                 inputFormatters: [
//                   FilteringTextInputFormatter.digitsOnly,
//                   LengthLimitingTextInputFormatter(11), // Adjust the limit as needed
//                 ],
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue, width: 1.5),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                   ),
//                   hintText: 'Eg. 0193446789',
//                   hintStyle: TextStyle(fontSize: 12),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Log in or Sign up',
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//           iconTheme: IconThemeData(
//             color: Colors.white,
//           ),
//         ),
//         body: ListView(
//             children: [
//               Padding(
//                   padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
//                   child: Column(
//                     children: [
//                       Card(
//                         elevation: 4.0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(4.0),
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(4.0),
//                           child: Image.asset(
//                             'assets/images/ncnclogo.png',
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 24),
//                       buildPhoneNumber(_phoneNumber, updatePhoneNumber),
//                       SizedBox(height: 24),
//                       ElevatedButton(
//                         onPressed: () {
//                           getVerificationCode();
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.orange,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                         ),
//                         child: Container(
//                           width: double.infinity,
//                           child: Center(
//                             child: Text(
//                               "Get Verification Code",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 133), //135
//                     ],
//                   )
//               ),
//               CustomPaint(
//                 size: Size(MediaQuery.of(context).size.width, 100), //change this '50' to a height value that fills the rest of the unoccupied screen's height
//                 painter: SlopedHillPainter(),
//               ),
//             ]
//         )
//     );
//   }
// }