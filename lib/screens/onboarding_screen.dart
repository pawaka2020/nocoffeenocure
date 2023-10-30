/*
Displays the latest of the items from the [news] data group.
Example of [news] = Selamat Hari Raya greeting, new franchise opening, new menu
item, etc.
We should use a larger [news] image that fits the whole screen of the phone.
Show for 3 seconds only before moving to HomeScreen.
*/
import 'package:flutter/material.dart';
import 'package:nocoffeenocure/screens/home_screen.dart';

import '../main.dart';
import '../repos/dummy/newsfull.dart';
import '../repos/fullnews.dart';

class OnboardingScreen extends StatelessWidget {
  //String image = objectbox.fullNewsBox.getAll()[0].name;
  final image = FullNewsRepo().getAll()[0].name!;

  @override
  Widget build(BuildContext context) {
    print("onboarding screen started");

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child:Image.asset(
                image,
                fit: BoxFit.fill, // Stretch the image to fill the entire screen
                width: double.infinity, // Ensure it takes up the full width
                height: double.infinity, // Ensure it takes up the full height
              ),
            ),
          ],
        ),
      ),
    );
  }
}
