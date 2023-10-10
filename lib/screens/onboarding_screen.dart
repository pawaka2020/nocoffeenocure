/*
Displays the latest of the items from the [news] data group.
Example of [news] = Selamat Hari Raya greeting, new franchise opening, new menu
item, etc.
We should use a larger [news] image that fits the whole screen of the phone.
Show for 3 seconds only before moving to HomeScreen.
*/

import 'package:flutter/material.dart';
import 'package:nocoffeenocure/screens/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  // The actual screen
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            displayImage(),
          ],
        ),
      ),
    );
  }
  // Function to display the image.
  Widget displayImage() {
    return Image.asset(
      'assets/images/newsbanner1.png', // Path to your dummy image.
      width: 400, // Customize the width as needed.
      height: 300, // Customize the height as needed.
      fit: BoxFit.contain, // Adjust the fit as needed.
    );
  }
}