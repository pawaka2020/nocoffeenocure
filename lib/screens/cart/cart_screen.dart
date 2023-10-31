import 'package:flutter/material.dart';

import 'ordersubmit.dart';

class CartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool empty = false;

  @override
  Widget build(BuildContext context) {
    if (empty == false)
      return CartDisplay();
    else return placeholder2;
  }
}

Center placeholder = Center(
    child: Text(
      'Cart page',
      style: TextStyle(fontSize: 24),
    )
);

Center placeholder2 = Center(
    child: Text(
      'Cart is empty',
      style: TextStyle(fontSize: 24),
    )
);

class CartDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [],
            ),
          ),//cart screen and other items.
          OrderSubmit()
        ]
      )
    );
  }
}