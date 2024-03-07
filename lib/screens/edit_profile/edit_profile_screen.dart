import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nocoffeenocure/screens/edit_profile/savechanges.dart';
import 'package:nocoffeenocure/screens/edit_profile/takephotoscreen.dart';
import '../../common.dart';
import '../../main.dart';
import '../../repos/user.dart';
import '../../widgets/partial_divider.dart';
import '../cart/specialrequest.dart';
import 'addressfield.dart';
import 'birthdayfield.dart';
import 'editnamefield.dart';
import 'imageselection.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class EditProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfileScreen> {
  String _name = singletonUser.name!;
  String _email = singletonUser.email!;
  DateTime _birthday = singletonUser.birthday!;
  String _address = singletonUser.address!;

  bool _setDefaultAddress = singletonUser.setDefaultAddress;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  String _profileImage = singletonUser.profileImage!;
  late XFile file;
  //bool newlyRegistered = singletonUser.newlyRegistered;
  //bool? newUser = singletonUser.newUser;

  //camera stuff
  late CameraController _controller;
  late Future<void> _controllerInitialization;

  @override
  initState() {
    super.initState();
    _nameController.text = _name;
    _emailController.text = _email;
    _addressController.text = _address;
  }

  void updateName(String name) {
    setState(() {
      _name = name;
    });
  }

  void updateEmail(String email) {
    setState((){
      _email = email;
    });
  }

  void updateBirthday(DateTime birthday) {
    setState((){
      _birthday = birthday;
    });
  }

  void updateAddress(String address) {
    setState((){
      _address = address;
    });
  }

  //merge with updateAddress later.
  void updatesetDefaultAddress (bool setDefaultAddress) {
    setState(() {
      _setDefaultAddress = setDefaultAddress;
    });
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    //printToast("camera found = ${firstCamera.toString()}");
    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );
    _controllerInitialization = _controller.initialize();
    printToast("camera initialized = ${_controllerInitialization.toString()}");
    //permissions taken here
  }

  Future<void> _takePhoto() async {
    final XFile image = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => TakePhotoScreen()));
    if (image != null) {
      setState(() {
        _profileImage = image.path;
      });
    }
  }

  Future<void> _selectPhotoLibrary() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null && mounted) {
        setState(() {
          _profileImage = image.path;
        });
      }
      else return;
    }
    catch (e) {
      printToast("Error picking image: $e");
    }
  }

  Future<bool> checkAddress(String address) async {
    bool result = true;
    final apiUrl =
        'https://nominatim.openstreetmap.org/search?format=json&q=$address&countrycodes=MY';
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<String> addresses = data.map((result) => result['display_name'] as String).toList();
        if (addresses.isEmpty) {
          printToast("Error: invalid address");
          return false;
        }
        else {
          return true;
        }
      }
      else {
        printToast("Error: address checking failed");
        return false;
      }
    } catch (e) {
      throw Exception('Error: $e');
      return false;
    }
    return result;
  }


  void saveChanges(BuildContext context) async {

    if (_setDefaultAddress == true) {
      bool result = true;
      result = await checkAddress(_address);
      if (result == false) return ;
    }

    UserRepo().updateLoggedinUser(_profileImage, _name, _email, _birthday, _address,
        _setDefaultAddress);
    printToast("Changes saved");
    //do the same for photo, email, birthday, address, setting delivery address
    Navigator.of(context).pop(true);
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
              children: [
                SizedBox(height: 20),
                buildImageSelection(context, _profileImage, _takePhoto, _selectPhotoLibrary),
                SizedBox(height: 5),
                PartialDivider(20, 30),
                buildField("Name", 'Eg. John Doe', _nameController, updateName),
                SizedBox(height: 10),
                PartialDivider(20, 30),
                //email
                buildField("Email", 'Eg. example@gmail.com', _emailController, updateEmail),
                SizedBox(height: 10),
                PartialDivider(20, 30),
                //buildPhoneField
                buildBirthdayField(_birthday, updateBirthday, context),
                PartialDivider(20, 30),
                AddressField(_address, _setDefaultAddress, updateAddress, updatesetDefaultAddress),
              ],
            ),
          ),
          buildSaveChanges(context, saveChanges),
        ]
      )
    );
  }
}

Widget buildField(String title, String hintText, TextEditingController controller,
    Function(String) onFieldChanged) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(),
        ),
      ), //text
      SizedBox(height: 5), //spacing
      TextField(
        controller: controller,
        onChanged: onFieldChanged,
        style: TextStyle(fontSize: 12, color: Colors.blue),
        //maxLength: 30,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 10) // Temporary placeholder text
        ),
      ),
      // You can display 'specialRequest' here.
    ],
  );
}

