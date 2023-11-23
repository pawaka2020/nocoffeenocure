import 'package:flutter/material.dart';

class TrackLocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Track Location',
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

