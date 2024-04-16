import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:flutter/services.dart';

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

/* await getImage(news['name'],'fullnews')*/

// Future<String> getImage(String dbimage, String dir) async {
//   String filename = dbimage.split('/').last;
//   String imageUrl = onlineBackendURL + 'images/' + dir + '/' + filename;
//   var imageDataResponse = await http.get(Uri.parse(imageUrl));
//
//   if (imageDataResponse.statusCode == 200) {
//     Directory directory = await getApplicationDocumentsDirectory();
//     String directoryPath = '${directory.path}/backend/images/';
//     Directory(directoryPath).createSync(recursive: true); // Ensure directory exists
//     String filePath = '$directoryPath$filename';
//     File file = File(filePath);
//     await file.writeAsBytes(imageDataResponse.bodyBytes);
//     return filePath;
//   }
//   else {
//     return '';
//   }
// }


Future<String> getImage(String dbImage, String dir) async {
  String filename = dbImage.split('/').last;
  String imageUrl = onlineBackendURL + 'static/images/' + dir + '/' + filename;
  var imageDataResponse = await http.get(Uri.parse(imageUrl));

  if (imageDataResponse.statusCode == 200) {
    Directory directory = await getApplicationDocumentsDirectory();
    String directoryPath = '${directory.path}/backend/images/$dir/';
    Directory(directoryPath).createSync(recursive: true); // Ensure directory exists
    String filePath = '$directoryPath$filename';
    File file = File(filePath);
    await file.writeAsBytes(imageDataResponse.bodyBytes);
    return filePath;
  } else {
    return '';
  }
}


Future<String> copyAssetToStorage(String image) async {
  try {
    // Get the directory where the file will be saved
    Directory directory = await getApplicationDocumentsDirectory();
    String directoryPath = '${directory.path}/backend/images/';
    Directory(directoryPath).createSync(recursive: true);

    // Read the asset file as bytes
    ByteData data = await rootBundle.load(image);
    List<int> bytes = data.buffer.asUint8List();

    // Write the bytes to the file in the new location
    String imagename = image.split('/').last;
    //String filePath = '$directoryPath/news1.png';
    String filePath = '$directoryPath$imagename';
    File file = File(filePath);
    await file.writeAsBytes(bytes);
    return filePath;
  }
  catch (e) {
    print('Error copying asset: $e');
    return '';
  }
}

Future<bool> showDeleteConfirmationDialog(BuildContext context, String text1, String text2) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
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

//String onlineBackendURL = 'http://192.168.1.21:5000/';

String onlineBackendURL = 'http://192.168.1.40:5000/';

bool countriesLoaded = false;
bool fullnewsLoaded = false;
bool bannernewsLoaded = false;
bool menuitemLoaded = false;
bool voucherLoaded = false;