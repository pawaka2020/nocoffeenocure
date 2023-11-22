import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void printToast(String message) {
    Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT, // or Toast.LENGTH_LONG
    gravity: ToastGravity.BOTTOM, // you can set the gravity, for example, ToastGravity.TOP
    timeInSecForIosWeb: 1, // only for iOS
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void handleDeepLink(String? link) {
  print("Deep link handle activated, $link");
  // if (link == 'yourapp://hello') {
  //   print('Hello World');
  // }
}