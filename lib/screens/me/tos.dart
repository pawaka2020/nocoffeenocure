import 'package:flutter/material.dart';

class TOSScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Terms of Service',
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
                  "assets/images/tospic.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('Welcome to "No Coffee, No Cure" – the ultimate coffee ordering app.',
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('1. Account Creation:'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(
                    'You must be at least 13 years old to use this app.',
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Provide accurate and current information during the account creation process.',
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('2. Coffee Orders:'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text('All coffee orders are non-refundable once processed.',
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 5),
                  Text('We are not responsible for any dissatisfaction with the coffee taste or temperature upon delivery.',
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('3. Payment:'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text('Payment for coffee orders is required in full before processing.',
                    textAlign: TextAlign.justify,),
                  SizedBox(height: 5),
                  Text('We use secure payment gateways to protect your financial information.',
                    textAlign: TextAlign.justify,),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('4. User Conduct:'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text('Users are prohibited from engaging in any disruptive or harmful behavior on the app.',
                    textAlign: TextAlign.justify,),
                  SizedBox(height: 5),
                  Text('Any attempt to hack, modify, or interfere with the app\'s functionality is strictly prohibited.',
                    textAlign: TextAlign.justify,),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('5. Intellectual Property:'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text('The "No Coffee, No Cure" app and its content are the intellectual property of the developers.',
                    textAlign: TextAlign.justify,),
                  SizedBox(height: 5),
                  Text('Users may not reproduce, distribute, or create derivative works without explicit permission.',
                    textAlign: TextAlign.justify,),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('6. Privacy Policy:'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text('Your privacy is important to us. Refer to our Privacy Policy for details on how we collect, use, and protect your personal information.',
                    textAlign: TextAlign.justify,),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('7. Termination:'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text('We reserve the right to terminate or suspend your account at our discretion, without prior notice, for any violation of these terms.',
                    textAlign: TextAlign.justify,),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('8. Disclaimer:'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text('"No Coffee, No Cure" is not liable for any health issues, lack of productivity, or failed attempts at staying awake resulting from the consumption of our coffee.',
                    textAlign: TextAlign.justify,),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('9. Updates:'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text('Terms of Service may be updated from time to time. Continued use of the app constitutes acceptance of the revised terms.',
                    textAlign: TextAlign.justify,),
                ],
              ),
            ),
            SizedBox(height: 20),
          ]
        )
    );
  }
}

