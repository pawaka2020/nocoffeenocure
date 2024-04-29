import 'package:flutter/material.dart';

/*
Still WIP.
This screen can only be implemented if payment gateway is fully implemented first.
*/
class PreviousOrdersScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Previous Orders',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: buildNoPreviousOrders(),
    );
  }
}

Widget buildNoPreviousOrders() => Center(
  child: Text("No orders")
);