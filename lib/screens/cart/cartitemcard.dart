import 'package:flutter/material.dart';


class CartItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,   //default 150
      height: 125,
      child: Card()//default 250 //works 230 //height 200
    );
  }

}