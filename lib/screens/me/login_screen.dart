import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Log in or Sign up')),
      body: Center(
        child: Text('This is the LoginScreen'),
      ),
    );
  }
}