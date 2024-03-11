import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../common.dart';
import '../../main.dart';
import '../../models/user.dart';
import '../../repos/bannernews.dart';
import '../../repos/cartitem.dart';
import '../../repos/country.dart';
import '../../repos/fullnews.dart';
import '../../repos/menuitem.dart';
import '../../repos/order.dart';
import '../../repos/token.dart';
import '../../repos/user.dart';
import '../../repos/voucher.dart';
import '../onboarding/onboarding_screen.dart';
import 'package:uni_links/uni_links.dart';
import 'dart:async';
import 'package:connectivity/connectivity.dart';
/*
Shows No Coffee No Cure's company logo for 3 seconds before moving to the next
screen.
*/
//final url = Uri.parse('yourapp://helloWorld');

Future<void> preLoadFromBackend(BuildContext context) async {
  var connectivityResult = await Connectivity().checkConnectivity();
  while (connectivityResult == ConnectivityResult.none) {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('You\'re offline'),
          content: Text('Please make sure you\'re connected to the Internet and try again'),
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
  //await CountryRepo().update(BackendSource.dummy);
  await FullNewsRepo().update(BackendSource.online); //
  await BannerNewsRepo().update(BackendSource.online); //

  await UserRepo().loginAppStart(BackendSource.dummy); //
  await VoucherRepo().update(BackendSource.dummy);
  //BackendSource.dummy
//dummy
  await MenuItemRepo().update(BackendSource.online); //dummy

  print("Data pre-loaded");
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //late StreamSubscription sub;
  String imageFile = 'assets/images/splashimage.png';
  int delay = 3;

  // void initDeepLinkListener() async {
  //   sub = uriLinkStream.listen((Uri? uri) {
  //     if (!mounted) return;
  //     handleDeepLink(uri?.toString());
  //   },
  //   onError: (err) {
  //     if (!mounted) return;
  //     print('Error: $err');
  //   });
  //   // Check for initial deep link when the app is launched
  //   final initialUri = await getInitialUri();
  //   handleDeepLink(initialUri?.toString());
  // }

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