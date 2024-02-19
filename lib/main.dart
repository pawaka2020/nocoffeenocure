import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nocoffeenocure/provider/cart_count_notifier.dart';
import 'package:nocoffeenocure/repos/bannernews.dart';
import 'package:nocoffeenocure/repos/country.dart';
import 'package:nocoffeenocure/repos/fullnews.dart';
import 'package:nocoffeenocure/repos/menuitem.dart';
import 'package:nocoffeenocure/repos/token.dart';
import 'package:nocoffeenocure/repos/user.dart';
import 'package:nocoffeenocure/repos/voucher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'common.dart';
import 'models/country.dart';
import 'models/fullnews.dart';
import 'models/user.dart';
import 'objectboxrepo.dart';
import 'screens/splash/splash_screen.dart';
import 'package:connectivity/connectivity.dart';
// Import your splash screen file.

/*
Singletons
*/
late ObjectBox objectbox;
late FlutterSecureStorage storage;
late UserOB singletonUser; //user created
//List<CountryOB> singletonCountries = [];
// late List<CountryOB> singletonCountries;
// late List<FullNewsOB> singletonFullNews;

enum BackendSource {
  dummy,
  online,
}
late final supabaseClient;
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