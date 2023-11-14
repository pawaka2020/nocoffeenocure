import 'package:flutter/cupertino.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

BottomNavyBarItem buildTrackNavyBarItem(bool tracking) {
  return BottomNavyBarItem(
    icon: Stack(
      children: [
        Icon(Icons.directions_bike), //the icon
        if (tracking == true) Positioned(
          left: 12,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: CircleAvatar(
              radius: 4,
              backgroundColor: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.only(left: 1),
                child: Text(
                  '!',
                  style: TextStyle(
                    fontSize: 8,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ), //'number'
          ),
        ), //the badge
      ],
    ),
    title: Text('Track', style: TextStyle(color: Colors.black)),
    activeColor: Colors.orange,
    textAlign: TextAlign.center,
  );
}