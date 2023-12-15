//FAQs with collapsible listviews
//eg. Who do I contact if I have problems ordering?
//you can email us at google@google.com' to have your orders processed.

import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'FAQ',
            style: TextStyle(
              color: Colors.white,
            ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: placeholder,
    );
  }
}

Center placeholder = Center(
    child: Text(
      'Help me!',
      style: TextStyle(fontSize: 24),
    )
);

