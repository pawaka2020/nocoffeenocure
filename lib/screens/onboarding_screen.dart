// display the latest news while simulating a loading process. Once the loading
// is complete, you'll navigate to the home_screen. You can use a Future.delayed
// to mimic the loading process.

import 'package:flutter/material.dart';
import 'package:nocoffeenocure/screens/home_screen.dart';

import '../dummy_screen.dart';

class OnboardingScreen extends StatelessWidget {
  // The actual screen
  @override
  Widget build(BuildContext context) {
    // Delayed navigation to the next screen.
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        //MaterialPageRoute(builder: (context) => const DummyScreen()),
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
