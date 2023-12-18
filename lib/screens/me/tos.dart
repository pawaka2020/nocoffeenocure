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
        body: placeholder
    );
  }
}

Center placeholder = Center(
    child: Text(
      'Terms of service',
      style: TextStyle(fontSize: 24),
    )
);