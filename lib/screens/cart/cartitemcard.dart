import 'package:flutter/material.dart';


class CartItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Container(
          width: double.infinity,   //default 150
          height: 125,
          child: Card()//default 250 //works 230 //height 200
      )

    );
    // return Container(
    //     width: double.infinity,   //default 150
    //     height: 125,
    //     child: Card()//default 250 //works 230 //height 200
    // );
  }

}