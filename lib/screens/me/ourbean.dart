import 'package:flutter/material.dart';

class OurBeanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Our Bean',
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
      'Our Bean',
      style: TextStyle(fontSize: 24),
    )
);