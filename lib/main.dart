import 'package:flutter/material.dart';
//import 'package:isar/isar.dart';

import 'package:nocoffeenocure/provider/cart_count_notifier.dart';
import 'package:nocoffeenocure/repos/offline/newsfull.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'objectboxrepo.dart';
import 'screens/splash/splash_screen.dart'; // Import your splash screen file.

late ObjectBox objectbox;

enum BackendSource {
  backend,
  dummy,
  testBackend,
}

/*
Implement CartCountNotifier to allow changes to cart icon's badge display in
HomeScreen.
Launches the app as usual afterwards starting with SplashScreen as first screen.
 */
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();

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
    final dir = getApplicationDocumentsDirectory();
    return MaterialApp(
      title:'No Coffee No Cure',
      theme: ThemeData(
            colorScheme: ColorScheme.
            fromSwatch(primarySwatch: Colors.orange).
            copyWith(background: Colors.white),
            fontFamily: 'Orbitron',
      ),
      home: const SplashScreen()
      //home: HomePage()
    );
  }
}