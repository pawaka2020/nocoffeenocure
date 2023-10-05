// Displays the app's logo and a loading animation during app initialization.
// TODO: Replace image and text with an actual single image that displays store
// TODO: logo and the catchphrase 'NO COFFEE NO CURE'.

import 'package:flutter/material.dart';

import '../dummy_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnboardingScreen()));
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DummyScreen()));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DummyScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Change the background color as needed.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add your app logo or branding here.
            Image.asset(
              'assets/images/coffeestockimage.png', // Replace with the actual path to your logo image.
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 20),
            const Text(
              'NO COFFEE NO CURE', // Customize the text and style.
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
