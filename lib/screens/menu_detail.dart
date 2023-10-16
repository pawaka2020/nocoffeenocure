import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/home.dart';

class MenuDetailsPage extends StatelessWidget {
  final MyMenuItem myMenuItem;

  MenuDetailsPage(this.myMenuItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myMenuItem.title),
      ),
      body: Center(
        child: Text("Details of ${myMenuItem.title}"),
      ),
    );
  }
}