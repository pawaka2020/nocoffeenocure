//import 'dart:html';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../common.dart';




Future<String> showImageSelectionDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Pick an Image"),
        actions: [
          TextButton(
            child: Text('Take a Photo'),
            onPressed: () {
              Navigator.of(context).pop('Take a Photo'); // Return false to indicate cancellation
            },
          ),
          TextButton(
            child: Text('Choose from Library'),
            onPressed: () {
              Navigator.of(context).pop('Choose from Library'); // Return true to indicate deletion confirmation
            },
          ),
        ],
      );
    },
  );
}

//go to order page and opy that drop down menu thingy when tapping the burger icon
void SelectImage(BuildContext context, Future<void> Function() takePhoto,
    Future<void> Function() selectPhotoLibrary) async {
  String choice = await showImageSelectionDialog(context);
  if (choice == 'Take a Photo') {
    takePhoto();
  }
  else if (choice == 'Choose from Library') {

    selectPhotoLibrary();
  }
}

Widget buildImageSelection(BuildContext context, String image, Future<void> Function() takePhoto,
    Future<void> Function() selectPhotoLibrary) {
  final profileDisplay;
  final iconDisplay;
  if (image == '') {
    profileDisplay = null;
    iconDisplay = Icon(
        Icons.person,
        size: 50,
        color: Colors.grey
    );
  }
  else {
    profileDisplay = FileImage(File(image));;
    iconDisplay = null;
  }
  return InkWell(
    onTap: () {
      SelectImage(context, takePhoto, selectPhotoLibrary);
    },
    child: Align(
        alignment: Alignment.center,
        child: Stack(
            alignment: Alignment.topRight,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: profileDisplay,
                backgroundColor: Colors.black12,
                child: iconDisplay,
              ),
              Container(
                margin: EdgeInsets.all(2),
                width: 27,
                height: 27,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ]
        )
    )
  );

}