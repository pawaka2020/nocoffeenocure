import 'package:flutter/material.dart';
import 'help.dart';
import 'login_screen.dart';

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
          //SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.only(top: 28.0, left: 16.0, right: 16.0), // Add top padding here
            //child: logcard,
            child:LoginCard()
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              children: [
                buildMeCard(context, 'Help', Icons.help_outline, HelpScreen()),
                buildMeCard(context, 'Contact Us', Icons.chat_bubble_outline),
                buildMeCard(context, 'Terms of Service', Icons.description),
                buildMeCard(context, 'Privacy Policy', Icons.privacy_tip),
                buildMeCard(context, 'About Us', Icons.info_outline),
                buildMeCard(context, 'Our Bean', Icons.local_cafe),
                buildMeCard(context, 'Locations', Icons.location_on),
                buildMeCard(context, 'Settings', Icons.settings),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMeCard(BuildContext context, String title, IconData icon, [Widget? screen]) {
    return MeCard(
      title: title,
      icon: icon,
      onTap: () {
        if (screen != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => screen,
            ),
          );
        }
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

/*
Sole card template just for logging in.
Another Consumer and Provider implementiation will be used here to handle
live updates of log in and log out.
*/
Card logcard = Card(
  elevation: 4.0,
  margin: EdgeInsets.symmetric(vertical: 8.0),
  color: Colors.orange, // Card background color
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
                color: Colors.white, // Text color
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
                fontSize: 16.0, // Smaller text size
                color: Colors.white, // Text color
              ),
            ),
          ),
        ),
      ],
    ),
  ),
);

class LoginCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the 'LoginScreen' when the Card is tapped
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
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


