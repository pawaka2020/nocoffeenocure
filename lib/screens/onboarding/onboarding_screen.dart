/*
Displays the latest of the items from the [news] data group.
Example of [news] = Selamat Hari Raya greeting, new franchise opening, new menu
item, etc.
We should use a larger [news] image that fits the whole screen of the phone.
Show for 3 seconds only before moving to HomeScreen.
*/
import 'package:flutter/material.dart';
import 'package:nocoffeenocure/screens/home_screen/home_screen.dart';
import '../../repos/fullnews.dart';

/*
Displays 'fullnews' items ie an image of greeting for Hari Raya
or news of new store opening that fills the whole of the phone screen.
There is a timer in place to make the screen automatically move to the next one
within 3 seconds.
*/
class OnboardingScreen extends StatelessWidget {
  final image = FullNewsRepo().getAll()[0].name!;

  @override
  Widget build(BuildContext context) {
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
              child: Image.network(
                  image,
                  fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}