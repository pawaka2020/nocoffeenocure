import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nocoffeenocure/provider/cart_count_notifier.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'objectboxrepo.dart';
import 'screens/splash/splash_screen.dart';

// Import your splash screen file.

/*
Singletons
*/
late ObjectBox objectbox;
late FlutterSecureStorage storage;
late UserOB singletonUser;
enum BackendSource {
  backend,
  dummy,
  testBackend,
}
final deepLink = 'nocoffeenocureapp://login';

/*
Implement CartCountNotifier to allow changes to cart icon's badge display in
HomeScreen.
Launches the app as usual afterwards starting with SplashScreen as first screen.
*/
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();

  //auth initialization goes here
  storage = FlutterSecureStorage();
  // storage.write(key: 'token', value: 'asdads');
  // final token = storage.read(key: 'token');

  // final String token = await secureStorage.read(key: 'token');
  // final String userType = await secureStorage.read(key: 'user_type');
  // Generate a guest token and store it with the user_type flag
  // final guestToken = generateGuestToken();
  // secureStorage.write(key: 'token', value: guestToken);
  // secureStorage.write(key: 'user_type', value: 'guest');


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