import 'dart:io';
import 'package:camera/camera.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'buildbirthdayfield.dart';
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
  TextEditingController _birthdayController = TextEditingController();
  //String _profileImage = singletonUser.profileImage!;
  String _profileImage = storedProfileImage;
  //late XFile file; //4/23/2024
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
    //printToast("birthday updated to ${_birthday.toString()}");
    setState(() {
      _birthday = birthday;
      //printToast("birthday updated to ${_birthday.toString()}");
    });
    //_birthday = birthday;
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
        //
        //storedProfileImage = image.path;
        //print("!!!!!!!!! before edit, saved photo = ${_profileImage}");
      });
    }
  }

  Future<void> _selectPhotoLibrary() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null && mounted) {
        setState(() {
          _profileImage = image.path;
          //
          //storedProfileImage = image.path;
          //print("!!!!!!!!! before edit, saved photo = ${_profileImage}");
        });
      }
      else return;
    }
    catch (e) {
      printToast("Error picking image: $e");
    }
  }

  Future<void> _removeProfileImage() async {
    setState(() {
      _profileImage = '';
    });
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
    // UserRepo().updateLoggedinUser(_profileImage, _name, _email, _birthday, _address,
    //     _setDefaultAddress);

    //storedProfileImage = _profileImage;

    UserRepo().update(_profileImage, _name, _email, _birthday, _address,
        _setDefaultAddress);
    printToast("Changes saved");
    storedProfileImage = _profileImage;
    //print("!!!!!!!!! after edit, saved photo = ${storedProfileImage}");
    //print("after saveChanges, profile image = ${singletonUser.profileImage}");
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
                buildImageSelection(context, _profileImage, _takePhoto, _selectPhotoLibrary, _removeProfileImage),
                SizedBox(height: 5),
                PartialDivider(20, 30),
                buildField("Name", 'Eg. John Doe', _nameController, updateName),
                SizedBox(height: 10),
                PartialDivider(20, 30),
                //email
                buildField("Email", 'Eg. example@gmail.com', _emailController, updateEmail),
                SizedBox(height: 10),
                PartialDivider(20, 30),
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

String _formatDate(DateTime date) {
  return "${date.day}/${date.month}/${date.year}";
}

// Widget buildBirthdayField2(BuildContext context, TextEditingController controller, DateTime? initialDate) {
//   return GestureDetector(
//     onTap: () async {
//       DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: initialDate ?? DateTime.now(),
//         firstDate: DateTime(1900),
//         lastDate: DateTime.now(),
//         builder: (BuildContext context, Widget? child) {
//           return Theme(
//             data: ThemeData.light().copyWith(
//               colorScheme: ColorScheme.light(
//                 primary: Colors.blue, // header background color
//                 onPrimary: Colors.white, // header text color
//                 surface: Colors.blue, // background color of calendar
//                 onSurface: Colors.black, // text color of calendar dates
//               ),
//               dialogBackgroundColor: Colors.white, // dialog background color
//             ),
//             child: child!,
//           );
//         },
//       );
//       if (picked != null && picked != initialDate) {
//         // Update the initialDate to the picked date
//         initialDate = picked;
//         controller.text = "${picked.year}-${picked.month}-${picked.day}";
//       }
//     },
//     child: AbsorbPointer(
//       child: TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: 'Birthday',
//           hintText: 'Enter your birthday',
//           prefixIcon: Icon(Icons.calendar_today),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please enter your birthday';
//           }
//           return null;
//         },
//       ),
//     ),
//   );
// }
