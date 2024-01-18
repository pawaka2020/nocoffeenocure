import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Privacy Policy',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: ListView(
            padding: EdgeInsets.only(left:24.0, right: 24.0, bottom: 16.0),
            children: [
              SizedBox(height: 20),
              Card(
                elevation: 4.0, // Add elevation for a floating effect
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.asset(
                    "assets/images/privacypolicy2.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text('Welcome to "No Coffee, No Cure" – the ultimate coffee ordering app.',
                    textAlign: TextAlign.justify),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text('1. Information We Collect:'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      'We may collect personal information such as your name, email address, and payment details when you create an account or place a coffee order.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'We also collect non-personal information, including device information and usage patterns.',
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text('2. How We Use Your Information:'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      'Personal information is used to process your coffee orders and improve our services.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Non-personal information helps us analyze app usage and enhance user experience.',
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text('3. Data Security:'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      'We prioritize the security of your data and implement measures to protect it from unauthorized access.',
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text('4. Sharing of Information:'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      'We do not sell or share your personal information with third parties for marketing purposes.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'We may share information with service providers for order processing and app improvement.',
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text('5. Changes to Privacy Policy:'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      'Any updates to our Privacy Policy will be communicated through the app.',
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text('By using the "No Coffee, No Cure" app, you agree to the terms outlined in this Privacy Policy.',
                    textAlign: TextAlign.justify),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  ],
                ),
              ),
            ]
        ),
    );
  }
}