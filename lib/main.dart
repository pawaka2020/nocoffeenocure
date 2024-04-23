import 'package:flutter/material.dart';
import 'package:nocoffeenocure/provider/cart_count_notifier.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'objectboxrepo.dart';
import 'screens/splash/splash_screen.dart';

/*
Singletons
*/
late ObjectBox objectbox;
late UserOB singletonUser; //user created
late String storedProfileImage;

enum BackendSource {
  dummy,
  online,
}
final deepLink = 'nocoffeenocureapp://login';
late final supabaseClient;

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