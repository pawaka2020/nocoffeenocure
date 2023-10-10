import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

/*
Shows No Coffee No Cure's company logo for 3 seconds before moving to the next
screen.
*/
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //navigate to next screen after 3 seconds delay
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
    });
  }

  //the actual screen
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