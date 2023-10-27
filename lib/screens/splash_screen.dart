import 'package:flutter/material.dart';
import '../main.dart';
import '../model.dart';
import '../repos/bannernews.dart';
import '../repos/fullnews.dart';
import '../repos/topbannernewsrepo.dart';
import 'onboarding_screen.dart';

/*
Shows No Coffee No Cure's company logo for 3 seconds before moving to the next
screen.
*/
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

String imageFile = 'assets/images/splashimage.png';
int delay = 3;

class _SplashScreenState extends State<SplashScreen> {
  String imageFile = 'assets/images/splashimage.png';
  int delay = 3;

  @override
  void initState() {
    super.initState();

    // preLoadFromBackend().then((_) {
    //   Future.delayed(Duration(seconds: delay), () {
    //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
    //   });
    // });

    // Future.delayed(Duration(seconds: delay), () {
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
    // });

    preLoadFromBackend().then((_) {
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

Future<void> preLoadFromBackend() async {
  await updateNewsFullBox(BackendSource.dummy);
  await TopBannerNewsRepo().update(BackendSource.dummy);
  await FullNewsRepo().update(BackendSource.dummy);
  await BannerNewsRepo().update(BackendSource.dummy);
  print ("data pre-loaded");// You may need to make updateNewsFullBox async
}

Future<void> updateNewsFullBox(BackendSource source) async {

  late NewsFull newsFull;
  if (source == BackendSource.dummy) {
    newsFull = await getNewsFullDummy();
  }

  final newsFullBox = objectbox.newsFullBox;
  final existingNewsFull = newsFullBox.get(1); // Assuming you want to work with an entry with ID 1.

  if (existingNewsFull != null) {
    // An entry with ID 1 exists; update its values
    existingNewsFull.name = 'assets/images/splashimage.png';
    newsFullBox.put(existingNewsFull); // Update the existing entry
    print('Data updated for existing entry with ID 1.');
  }
  else {
    // Entry with ID 1 doesn't exist; create a new one
    var newsfull = NewsFull()..name = 'assets/images/splashimage.png';
    final id = newsFullBox.put(newsfull); // Add a new entry
    print('Data pre-loaded for new entry, id = $id');
  }
}

void emptyNewsFullBox() {
  final box = objectbox.newsFullBox;
  final allNewsFull = box.getAll(); // Get all objects in the box

  for (final newsFull in allNewsFull) {
    box.remove(newsFull.id); // Remove each object by its ID
  }
  print('newsFullBox has been emptied.');
}