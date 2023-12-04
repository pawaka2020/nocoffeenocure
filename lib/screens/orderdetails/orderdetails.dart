import 'package:flutter/material.dart';
import '../../models/order.dart';
import '../../models/user.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderOB? currentOrder;
  OrderDetailsScreen(this.currentOrder);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Details',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: placeholder(currentOrder),
    );
  }
}

Widget placeholder(OrderOB? currentOrder) => Center(
    child: Text(
      '#${currentOrder?.orderId.toString()}',
      style: TextStyle(fontSize: 24),
    )
);
