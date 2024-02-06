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

String lorem = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

String onlineBackendURL = 'http://192.168.1.54:5000/';