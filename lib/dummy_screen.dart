import 'package:flutter/material.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy Screen'), // Set the screen title here.
      ),
      body: const Center(
        child: Text(
          'Hello World',
          style: TextStyle(
            fontSize: 24, // Adjust the font size as needed.
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}