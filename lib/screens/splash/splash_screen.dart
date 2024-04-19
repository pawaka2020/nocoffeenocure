import 'package:flutter/material.dart';
import '../../main.dart';
import '../../repos/bannernews.dart';
import '../../repos/fullnews.dart';
import '../../repos/menuitem.dart';
import '../../repos/user.dart';
import '../../repos/voucher.dart';
import '../onboarding/onboarding_screen.dart';
import 'dart:async';
import 'package:connectivity/connectivity.dart';
/*
Shows No Coffee No Cure's company logo for 3 seconds before moving to the next
screen.
*/
Future<void> preLoadFromBackend(BuildContext context) async {
  var connectivityResult = await Connectivity().checkConnectivity();
  while (connectivityResult == ConnectivityResult.none) {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('You\'re offline'),
          content: Text('Please make sure you\'re connected to the Internet and try again.'),
          actions: [
            TextButton(
              child: Text('Ok'),
              onPressed: () async {
                Navigator.of(context).pop(false); // Close the dialog and return false
              },
            ),
          ],
        );
      },
    );
    connectivityResult = await Connectivity().checkConnectivity();
  }
  // Proceed with repository updates after connectivity is restored
  await FullNewsRepo().update(BackendSource.online); // dummy
  await BannerNewsRepo().update(BackendSource.online); // dummy
  await UserRepo().loginAppStart(BackendSource.dummy); //
  await VoucherRepo().update(BackendSource.online); //
  await MenuItemRepo().update(BackendSource.online); // dummy

  print("Data pre-loaded");
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String imageFile = 'assets/images/splashimage.png';
  int delay = 3;

  @override
  initState() {
    super.initState();
    preLoadFromBackend(context).then((_) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
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