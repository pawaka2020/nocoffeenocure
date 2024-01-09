import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../common.dart';

class PhotoFromLibraryScreen extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => PhotoFromLibraryState();
}

class PhotoFromLibraryState extends State<PhotoFromLibraryScreen> {
  XFile? _selectedImage;

  Future<void> _pickImageFromLibrary() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null && mounted) {
        setState(() {
          _selectedImage = image;
          //Navigator.of(context).pop(image); //mine
        });
      }
      else return;
    }
    catch (e) {
      printToast("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {

    _pickImageFromLibrary();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Image From Library',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _selectedImage != null
                ? Image.file(File(_selectedImage!.path))
                : placeholder,
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(_selectedImage);
              },
              child: Text('Select Image'),
            ),
          ],
        ),
      ),
    );
  }
  
}

Center placeholder = Center(
    child: Text(
      'Take Photo from Library',
      style: TextStyle(fontSize: 24),
    )
);