/*
Displays the latest of the items from the [news] data group.
Example of [news] = Selamat Hari Raya greeting, new franchise opening, new menu
item, etc.
We should use a larger [news] image that fits the whole screen of the phone.
Show for 3 seconds only before moving to HomeScreen.
*/
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nocoffeenocure/screens/home_screen/home_screen.dart';
import '../../backend/online/fullnews.dart';
import '../../main.dart';
import '../../models/fullnews.dart';
import '../../repos/fullnews.dart';


class OnboardingScreen extends StatelessWidget {
  //assume FullNewsOnline() is used here.
  final image = FullNewsRepo().getAll()[0].name!;

  @override
  Widget build(BuildContext context) {
    // print("onboarding screen started");
    // print("fullnews image = ${image}");
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
            // Expanded(
            //   //I want this to use '/data/user/0/com.example.nocoffeenocure/app_flutter/backend/images/news1.png' instead.
            //   child: Image.asset(
            //     image,
            //     fit: BoxFit.fill, // Stretch the image to fill the entire screen
            //     width: double.infinity, // Ensure it takes up the full width
            //     height: double.infinity, // Ensure it takes up the full height
            //   ),
            // ),
            Expanded(
              child: Image.file(
                File(image),
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
