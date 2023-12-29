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
          ]
        )
    );
  }
}

Center placeholder = Center(
    child: Text(
      'Terms of service',
      style: TextStyle(fontSize: 24),
    )
);