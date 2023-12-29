import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

String lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
String lorem2 = 'NO COFFEE NO CURE shines bright in the go-kart racing spotlight! A quick flashback to the thrill of the track – every moment a testament to teamwork, culminating in clinching that first prize! Huge thanks to all for the tremendous support.🏁🏆🚗☕️';
String lorem3 = 'Throwback to the wild go-kart racing event! Big shouts to our crazy team "NO COFFEE NO CURE" for clinching the first prize!Heartfelt thank you to everyone who sampled our delicious coffee at the coffee booth and supported us in every moment of the race. Time to party and soak in the glory of our wild ride to victory! 🏁🏆☕️';
String lorem4 = 'The moment youve been waiting for is here! Weve drawn the lucky names for our "Coffee Haven" Spooktacular Halloween Event, and its time to unveil the champions!';
String lorem5 = '🧙‍♂️🎃On this mysterious Halloween night, coffee is our potion of choice. Ding-ding-dong, the Black Witch Coffee is here! Stir with a wand, recite the incantation, and a cup of enigmatic flavor awaits your taste. Join us for our magical coffee party and take a sip of our mystical coffee brews! ☕🔮🌟';

void _launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

Widget newsCard(String image, String desc, String url) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          _launchURL(url);
        },
        child: Card(
          elevation: 4.0, // Add elevation for a floating effect
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      SizedBox(height: 10),
      Text(
        desc,
        maxLines: 3, // Limit text to three lines
        overflow: TextOverflow.ellipsis, // Add ellipsis (...) at the en
      ),
      SizedBox(height: 20),
    ]
  );
}

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
      children: [
        SizedBox(height: 40),
        newsCard("assets/images/instanews1.png", lorem2, "https://www.instagram.com/reel/Czvo9EVPSgL/"),
        newsCard("assets/images/instanews2.png", lorem3, "https://www.instagram.com/reel/CznAheXL1Co/"),
        newsCard("assets/images/instanews3.png", lorem4, "https://www.instagram.com/p/CzOYQf4xkL5/"),
        newsCard("assets/images/instanews4.png", lorem5, "https://www.instagram.com/p/CzD_tQHNSTv/"),
      ]
    );
  }
}