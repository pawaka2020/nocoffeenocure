import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../contactus/contactus.dart';
import '../me/privacy_policy.dart';
import '../me/tos.dart';

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