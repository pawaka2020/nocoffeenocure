import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nocoffeenocure/screens/verification/verifycode.dart';
import '../../common.dart';
import '../../widgets/partial_divider.dart';
import '../contactus/contactus.dart';
import '../me/privacy_policy.dart';
import '../me/tos.dart';
import 'buildverificationcodeboxes.dart';

class VerificationScreen extends StatefulWidget {
  String _phoneNumber;
  VerificationScreen(this._phoneNumber);

  @override
  State<StatefulWidget> createState() => VerificationScreenState(_phoneNumber);
}

class VerificationScreenState extends State<VerificationScreen> {
  String _phoneNumber;
  VerificationScreenState(this._phoneNumber);

  String enteredCode = '';

  void setEnteredCode(String _enteredCode) {
    enteredCode = _enteredCode;
    // printToast("Set entered code value = ${enteredCode}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Send Verification Code',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: Padding(
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
                  "Please enter the 4-digit verification code we sent to your registered phone number +60 ${_phoneNumber}",
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 24),
              buildVerificationCodeBoxes(context, setEnteredCode), //save the input value to verificationCode
              SizedBox(height: 12), //24
              ElevatedButton(
                onPressed: () {
                  //printToast("code entered = $enteredCode, phone number entered = $_phoneNumber");
                  verifyCode(enteredCode, _phoneNumber);
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
        )
    );
  }
}

Widget buildDisclaimerText(BuildContext context) {
  return Align(
    alignment: Alignment.center,
    child: Text.rich(
      TextSpan(
        text: 'If you encounter any issues receiving the verification code, please ',
        style: TextStyle(
          fontSize: 12,
        ),
        children: [
          TextSpan(
            text: 'Contact Us',
            style: TextStyle(
              fontSize: 12,
              color: Colors.blue, // Set color to blue
              decoration: TextDecoration.underline, // Add underline
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Navigate to another screen when "Contact Us" is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactUsScreen(), // Replace ContactUsScreen with your desired screen
                  ),
                );
              },
          ),
          TextSpan(
            text:
            ' for help.\n\nBy logging in or registering, you agree to our ',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: 'Terms of Service',
            style: TextStyle(
              fontSize: 12,
              color: Colors.blue, // Set color to blue
              decoration: TextDecoration.underline, // Add underline
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Navigate to another screen when "Contact Us" is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TOSScreen(), // Replace ContactUsScreen with your desired screen
                  ),
                );
              },
          ),
          TextSpan(
            text:
            ' and ',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: 'Privacy Policy.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.blue, // Set color to blue
              decoration: TextDecoration.underline, // Add underline
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Navigate to another screen when "Contact Us" is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrivacyPolicyScreen(), // Replace ContactUsScreen with your desired screen
                  ),
                );
              },
          ),
        ],
      ),
      textAlign: TextAlign.center,
    ),
  );
}

Widget buildTimerDisplay() {
  int timerDuration = 15; // Default timer duration in seconds

  return StreamBuilder<int>(
    stream: timerStream(timerDuration),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        int seconds = snapshot.data!;
        if (seconds > 0) {
          int minutes = seconds ~/ 60;
          int remainingSeconds = seconds % 60;
          String timerText =
              'Resend Code in ${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
          return Align(
            alignment: Alignment.center,
            child: Text(
              timerText,
              style: TextStyle(
                fontSize: 12,
              ),
            )
          );
        }
        else {
          return GestureDetector(
            onTap: () {
              printToast("Code resent");
            },
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Resend Code',
                style: TextStyle(
                  fontSize: 12,
                  //fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  decoration: TextDecoration.underline
                ),
              ),
            )
          );
        }
      }
      else {
        return Align(
          alignment: Alignment.center,
          child: Text('',
          style: TextStyle(fontSize:12))
        );
      }
    },
  );
}

Stream<int> timerStream(int duration) {
  StreamController<int> controller = StreamController<int>();
  int currentDuration = duration;

  Timer timer = Timer.periodic(Duration(seconds: 1), (timer) {
    controller.sink.add(currentDuration);
    if (currentDuration <= 0) {
      timer.cancel();
      controller.close();
    } else {
      currentDuration--;
    }
  });
  return controller.stream;
}


class VerificationCodeInput extends StatefulWidget {
  final void Function(String) onCodeEntered;

  VerificationCodeInput(this.onCodeEntered);

  @override
  _VerificationCodeInputState createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<VerificationCodeInput> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < 4; i++)
          SizedBox(
            width: 60,
            height: 60,
            child: TextField(
              controller: _controller,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 4, // Limiting to 4 characters
              onChanged: (value) {
                if (value.length == 4) {
                  // Notify the parent widget about the entered code
                  widget.onCodeEntered(value);
                  // Clear the input field
                  _controller.clear();
                }
              },
              decoration: InputDecoration(
                counterText: '', // Hide character count
                border: OutlineInputBorder(),
              ),
            ),
          ),
      ],
    );
  }
}