import 'package:flutter/material.dart';
import '../../models/user.dart';

class OrderDetailsScreen extends StatelessWidget {
  UserOB currentUser;
  OrderDetailsScreen(this.currentUser);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${currentUser.orders[0].cartItems[0].name}',
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
      'Order details!',
      style: TextStyle(fontSize: 24),
    )
);