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
final deepLink = 'nocoffeenocureapp://login';
late final supabaseClient;
/*
Implement CartCountNotifier to allow changes to cart icon's badge display in
HomeScreen.
Launches the app as usual afterwards starting with SplashScreen as first screen.
*/


Future<void> preLoadFromBackend2() async {
  //testToken();
  //create guest or log in as previously logged in user (guest or user).
  await CountryRepo().update(BackendSource.online);
  await UserRepo().loginAppStart(BackendSource.dummy);
  await VoucherRepo().update(BackendSource.dummy);
  await FullNewsRepo().update(BackendSource.online); //BackendSource.dummy
  await BannerNewsRepo().update(BackendSource.dummy);
  await MenuItemRepo().update(BackendSource.dummy);
  Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
    print('Network status changed: $result');

    if (result == ConnectivityResult.wifi || result == ConnectivityResult.mobile) {
      //if (singletonCountries != []) { //!=
      // if (singletonCountries[0].name == 'NO') {
      //   await CountryRepo().update(BackendSource.online);
      // }
      if (countriesLoaded == false) {
        await CountryRepo().update(BackendSource.online);
      }
    }
  });

  /*
  I think this one here is the culprit.
  This 'update' function provides the menu items, but it also wipes out
  menu items added to a 'cartitem' object.
  */

  /*
  this one also
  */
  //await CartItemRepo().update(BackendSource.dummy);
  //await OrderRepo();

  //testEditVoucher();
  print("data pre-loaded");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();

  // storage = FlutterSecureStorage();
  // await CountryRepo().update(BackendSource.online);
  // Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
  //   print('Network status changed: $result');
  //
  //   if ((result == ConnectivityResult.wifi || result == ConnectivityResult.mobile)
  //   && (singletonCountries != [])) {
  //     await CountryRepo().update(BackendSource.online);
  //   }
  //
  // });
  // preLoadFromBackend2().then((_) {
  //   runApp(
  //     ChangeNotifierProvider(
  //       create: (context) => CartCountNotifier(),
  //       child: MyApp(),
  //     ),
  //   );
  // });
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartCountNotifier(),
      child: MyApp(),
    ),
  );
  // Check for initial internet connectivity status
  // var connectivityResult = await Connectivity().checkConnectivity();
  // if (connectivityResult == ConnectivityResult.wifi ||
  //     connectivityResult == ConnectivityResult.mobile) {
  //   //await CountryRepo().update(BackendSource.online);
  // }
  // await CountryRepo().update(BackendSource.online);
  //
  // // Initialize the network connectivity listener
  // Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
  //   print('Network status changed: $result');
  //
  //   if (result == ConnectivityResult.wifi || result == ConnectivityResult.mobile) {
  //     await CountryRepo().update(BackendSource.online);
  //   }
  // });

  // runApp(
  //   ChangeNotifierProvider(
  //     create: (context) => CartCountNotifier(),
  //     child: MyApp(),
  //   ),
  // );
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