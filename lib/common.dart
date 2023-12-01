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

Future<bool> showDeleteConfirmationDialog(BuildContext context, String text1, String text2) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(text1),
        content: Text(text2),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(false); // Return false to indicate cancellation
            },
          ),
          TextButton(
            child: Text('Delete'),
            onPressed: () {
              Navigator.of(context).pop(true); // Return true to indicate deletion confirmation
            },
          ),
        ],
      );
    },
  );
}