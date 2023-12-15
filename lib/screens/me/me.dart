import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';
import '../../common.dart';
import 'help.dart';
import 'login_screen.dart';
import 'package:url_launcher/url_launcher.dart';

/*
Leads users to other screens 'help', 'talk to us', 'terms of service',
'privacy policy', 'about us'.
Log in card at the top.
According to website: 'About', 'Our Bean', 'Locations', Contact Us', 'Settings'
*/
class Me extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 28.0, left: 16.0, right: 16.0),
            child:LoginCard()
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              children: [
                buildMeCard(context, 'FAQ', Icons.help_outline, FAQScreen()),
                buildMeCard(context, 'Contact Us', Icons.chat_bubble_outline, FAQScreen()),
                buildMeCard(context, 'Terms of Service', Icons.description, FAQScreen()),
                buildMeCard(context, 'Privacy Policy', Icons.privacy_tip, FAQScreen()),
                buildMeCard(context, 'About Us', Icons.info_outline, FAQScreen()),
                buildMeCard(context, 'Our Bean', Icons.local_cafe, FAQScreen()),
                buildMeCard(context, 'Locations', Icons.location_on, FAQScreen()),
                buildMeCard(context, 'Settings', Icons.settings, FAQScreen()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void doNothing() {
    printToast("Do nothing");
  }

  void navigateTo(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }

  Widget buildMeCard(BuildContext context, String title, IconData icon, Widget screen) {
    return MeCard(
      title: title,
      icon: icon,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => screen,
        ));
      },
    );
  }
}

/*
Template for Cards in this screen.
*/
class MeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;

  MeCard({required this.title, required this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Padding(
          padding: EdgeInsets.all(12.0), //default 16
          child: Row(
            children: [
              Icon(
                icon,
                size: 27.0, //default 36
              ),
              SizedBox(width: 12.0), //default 16
              Text(
                title,
                style: TextStyle(
                  fontSize: 15.0, //default 20
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//make this a stateful widget later so it can shift forms.
class LoginCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigate to the 'LoginScreen' when the Card is tapped
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => LoginScreen(),
        // ));
        //sendWhatsapp(context);
        handleDeepLink('ncncapp://hello');
      },
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.orange,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    'Welcome, Guest',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  child: Text(
                    'Log in or Sign Up',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void sendWhatsapp(BuildContext context) async {
  String phone = "+60172520691";
  String messageTest = "Hello World";
  String message = "Hi No Coffee No Cure, I need my cure now!";
  final url = Uri.parse('https://wa.me/$phone?text=${Uri.encodeFull(message)}');
  String? urlResponse;

  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
  else {
    //capture url link when user clicks on the URL response presented by Whatsapp Business API.
    //urlResponse = ??
  }
  final result = linkStream.listen((String? link) {
    // Handle the link and extract parameters
    print("Link received: $link");

    // Extract parameters from the link (token, phone, etc.)
    // Perform user authentication based on the received parameters
  });
}

//https://omegacoffee.com/redirect?token=unique_token&app_installed=true
//unique_token = eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c




