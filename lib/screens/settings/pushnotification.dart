import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

Widget buildPushNotification(bool notificationToggle, void Function(bool value) setNotification) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Push Notifications',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      Switch(
        value: notificationToggle,
        onChanged: (value) {
          setNotification(value);
        },
      ),
    ],
  );
}

Widget buildPushNotification2(bool notificationToggle, void Function(bool value) setNotification) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Push Notifications',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      FlutterSwitch(
        width: 100, //125
        height: 35.0, //55
        valueFontSize: 16.0, //25 //16
        toggleSize: 32.0, //45 //16
        value: notificationToggle,
        borderRadius: 15.0, //30 //10
        padding: 8.0,
        showOnOff: true,
        onToggle: (value) {
          setNotification(value);
        },
      ),
    ],
  );
}