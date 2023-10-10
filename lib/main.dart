import 'package:flutter/material.dart';
import 'package:nocoffeenocure/provider/cart_count_notifier.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart'; // Import your splash screen file.

/*
Implement CartCountNotifier to allow changes to cart icon's badge display in
HomeScreen.
Launches the app as usual afterwards starting with SplashScreen as first screen.
 */
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartCountNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'No Coffee No Cure',
      theme: ThemeData(
            colorScheme: ColorScheme.
            fromSwatch(primarySwatch: Colors.orange).
            copyWith(background: Colors.white)
      ),
      home: const SplashScreen()
    );
  }
}