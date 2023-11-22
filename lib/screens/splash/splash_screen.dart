import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../common.dart';
import '../../main.dart';
import '../../repos/bannernews.dart';
import '../../repos/cartitem.dart';
import '../../repos/fullnews.dart';
import '../../repos/menuitem.dart';
import '../../repos/user.dart';
import '../../repos/voucher.dart';
import '../onboarding/onboarding_screen.dart';
import 'package:uni_links/uni_links.dart';
import 'dart:async';
/*
Shows No Coffee No Cure's company logo for 3 seconds before moving to the next
screen.
*/
//final url = Uri.parse('yourapp://helloWorld');

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

String imageFile = 'assets/images/splashimage.png';
int delay = 3;

class _SplashScreenState extends State<SplashScreen> {
  late StreamSubscription sub;
  String imageFile = 'assets/images/splashimage.png';
  int delay = 5;

  void initDeepLinkListener() async {
    sub = uriLinkStream.listen((Uri? uri) {
      if (!mounted) return;
      handleDeepLink(uri?.toString());
    },
    onError: (err) {
      if (!mounted) return;
      print('Error: $err');
    });
    // Check for initial deep link when the app is launched
    final initialUri = await getInitialUri();
    handleDeepLink(initialUri?.toString());
  }

  @override
  initState() {
    super.initState();
    Future.delayed(Duration(seconds: delay), () {
      preLoadFromBackend().then((_) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => OnboardingScreen()));
      });
    });
    //set up deeplink listener here.
    initDeepLinkListener();
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
  //create guest or log in as previously logged in user (guest or user).
  await UserRepo().loginAppStart(BackendSource.dummy);
  await VoucherRepo().update(BackendSource.dummy);
  await FullNewsRepo().update(BackendSource.dummy);
  await BannerNewsRepo().update(BackendSource.dummy);
  await MenuItemRepo().update(BackendSource.dummy);
  await CartItemRepo().update(BackendSource.dummy);



  print ("data pre-loaded");
}
