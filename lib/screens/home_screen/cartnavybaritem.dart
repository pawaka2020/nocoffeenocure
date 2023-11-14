import 'package:flutter/cupertino.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

BottomNavyBarItem buildCartNavyBarItem(int cartCount) {
  return BottomNavyBarItem(
    icon: Stack(
      children: [
        Icon(Icons.shopping_cart), //the icon
        if (cartCount > 0) Positioned(
          left: 12,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red, // Set the background color of the badge
            ),
            child: CircleAvatar(
              radius: 4, // Adjust the size of the badge, default 4
              backgroundColor: Colors.transparent,
              child: Text(
                cartCount.toString(),
                style: TextStyle(
                  fontSize: 8,
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ), //'number'
          ),
        )
      ],
    ),
    title: Text('Cart', style: TextStyle(color: Colors.black)),
    activeColor: Colors.orange,
    textAlign: TextAlign.center,
  );
}