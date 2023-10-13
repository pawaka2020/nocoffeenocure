import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/home.dart';

class MenuDetailsPage extends StatelessWidget {
  final MenuItem menuItem;
  MenuDetailsPage(this.menuItem);

  @override
  Widget build(BuildContext context) {
    // Build your details page using menuItem
    return Scaffold(
      appBar: AppBar(
        title: Text(menuItem.title),
      ),
      body: Center(
        child: Text("Details of ${menuItem.title}"),
      ),
    );
  }
}
