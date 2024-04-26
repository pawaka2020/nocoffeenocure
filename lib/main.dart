import 'package:flutter/material.dart';
import 'package:nocoffeenocure/provider/cart_count_notifier.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'objectboxrepo.dart';
import 'screens/splash/splash_screen.dart';

/*
Singletons :
Objectbox instance to enable use of an offline persistence database for preloading data
User as a singleton, fields obtained from backend.
*/
late ObjectBox objectbox;
late UserOB singletonUser; //user created
late String storedProfileImage;

enum BackendSource {
  dummy, //this is no longer working since the Flutter app has fully migrated to an online server.
  online,
}

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
    return MaterialApp(
        title:'No Coffee No Cure',
        theme: ThemeData(
          colorScheme: ColorScheme.
          fromSwatch(primarySwatch: Colors.orange).
          copyWith(background: Colors.white),
          fontFamily: 'Orbitron',
        ),
        home: const SplashScreen()
    );
  }
}