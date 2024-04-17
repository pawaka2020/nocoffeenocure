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
        title: Text("Pick an image"),
        actions: [
          TextButton(
            child: Text('Take a photo'),
            onPressed: () {
              Navigator.of(context).pop('Take a photo'); // Return false to indicate cancellation
            },
          ),
          TextButton(
            child: Text('Choose from library'),
            onPressed: () {
              Navigator.of(context).pop('Choose from library'); // Return true to indicate deletion confirmation
            },
          ),
          TextButton(
            child: Text('Remove profile image'),
            onPressed: () {
              Navigator.of(context).pop('Remove profile image');
            }
          ),
        ],
      );
    },
  );
}

//go to order page and opy that drop down menu thingy when tapping the burger icon
void SelectImage(BuildContext context, Future<void> Function() takePhoto,
    Future<void> Function() selectPhotoLibrary, Future<void> Function() removeProfileImage) async {
  String choice = await showImageSelectionDialog(context);
  if (choice == 'Take a photo') {
    takePhoto();
  }
  else if (choice == 'Choose from library') {
    selectPhotoLibrary();
  }
  else if (choice == 'Remove profile image') {
    removeProfileImage();
  }
}

Widget buildImageSelection(BuildContext context, String image, Future<void> Function() takePhoto,
    Future<void> Function() selectPhotoLibrary, Future<void> Function() removeProfileImage) {
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
      SelectImage(context, takePhoto, selectPhotoLibrary, removeProfileImage);
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