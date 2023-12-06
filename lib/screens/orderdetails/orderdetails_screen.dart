import 'package:flutter/material.dart';
import 'package:nocoffeenocure/screens/orderdetails/itemcard.dart';
import '../../common.dart';
import '../../main.dart';
import '../../models/cartitem.dart';
import '../../models/order.dart';
import '../../models/user.dart';

class OrderDetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    UserOB? currentUser = singletonUser;
    OrderOB? currentOrder = currentUser.orders.firstWhere((order) => order.active == true);
    //List<CartItemOB> cartItems = currentOrder?.cartItems;
    print("in order details, singleton order length = ${singletonUser.orders.length.toString()}");
    print('in order details, singleton order cart length = ${singletonUser.orders[0].cartItems.length.toString()}');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order #${currentOrder?.orderId.toString()}',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ...currentOrder!.cartItems.map((item) => ODItemCard(item)),
                ]
              )
            ),
          ]
      ),
    );
  }
}

Widget placeholder(OrderOB? currentOrder) => Center(
    child: Text(
      '',
      style: TextStyle(fontSize: 24),
    )
);








