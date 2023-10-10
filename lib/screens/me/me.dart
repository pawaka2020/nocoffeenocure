import 'package:flutter/material.dart';
import 'help.dart';

/*
Leads users to other screens 'help', 'talk to us', 'terms of service',
'privacy policy', 'about us'.
Log in card at the top.
*/
class Me extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        padding:EdgeInsets.all(16),
        children:[
          SizedBox(height: 16.0),
          logcard,
          MeCard(
            title: 'Help',
            icon: Icons.help_outline,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HelpScreen(),
                ),
              );
            },
          ),
          MeCard(
            title: 'Talk to Us',
            icon: Icons.chat_bubble_outline,
            onTap: () {
              //Navigator.pushNamed(context, '/talk_to_us');
            },
          ),
          MeCard(
            title: 'Terms of Service',
            icon: Icons.description,
            onTap: () {
              //Navigator.pushNamed(context, '/terms_of_service');
            },
          ),
          MeCard(
            title: 'Privacy Policy',
            icon: Icons.privacy_tip,
            onTap: () {
              //Navigator.pushNamed(context, '/privacy_policy');
            },
          ),
          MeCard(
            title: 'About Us',
            icon: Icons.info_outline,
            onTap: () {
              //Navigator.pushNamed(context, '/about_maxi_coffee');
            },
          ),
        ]
      ),
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
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 36.0,
              ),
              SizedBox(width: 16.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
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
  color: Colors.blue, // Card background color
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