import 'package:flutter/material.dart';
import '../../main.dart';
import '../../repos/bannernews.dart';
import '../../repos/cartitem.dart';
import '../../repos/fullnews.dart';
import '../../repos/menuitem.dart';
import '../../repos/voucher.dart';
import '../onboarding/onboarding_screen.dart';

/*
Shows No Coffee No Cure's company logo for 3 seconds before moving to the next
screen.
*/
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

String imageFile = 'assets/images/splashimage.png';
int delay = 3;

class _SplashScreenState extends State<SplashScreen> {
  String imageFile = 'assets/images/splashimage.png';
  int delay = 5;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: delay), () {
      preLoadFromBackend().then((_) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Change the background color as needed.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Image.asset(
                    imageFile,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                )
            )
          ],
        ),
      ),
    );
  }
}

Future<void> preLoadFromBackend() async {
  await FullNewsRepo().update(BackendSource.dummy);
  await BannerNewsRepo().update(BackendSource.dummy);
  await MenuItemRepo().update(BackendSource.dummy);
  await CartItemRepo().update(BackendSource.dummy);
  await VoucherRepo().update(BackendSource.dummy);
  print ("data pre-loaded");
}