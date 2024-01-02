import 'package:avatar_better/avatar_better.dart';
import 'package:flutter/material.dart';

import '../../common.dart';
import '../../main.dart';
import '../../widgets/partial_divider.dart';
import '../cart/specialrequest.dart';
import 'birthdayfield.dart';
import 'editnamefield.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfileScreen> {
  String _name = singletonUser.name!;
  String _email = singletonUser.email!;
  DateTime _birthday = singletonUser.birthday!;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = _name;
    _emailController.text = _email;
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
      printToast("birthday is now ${_birthday.toString()}");
    });
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
      body: ListView(
        padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
        children: [
          SizedBox(height: 20),
          buildImageSelection(_name),
          SizedBox(height: 5),
          PartialDivider(20, 30),
          buildField("Name", 'Eg. John Doe', _nameController, updateName),
          SizedBox(height: 10),
          PartialDivider(20, 30),
          //email
          buildField("Email", 'Eg. example@gmail.com', _emailController, updateEmail),
          SizedBox(height: 10),
          PartialDivider(20, 30),
          //BirthdayField(initialDate: _birthday!, onDateChanged: updateBirthday, ),
          buildBirthdayField(_birthday, updateBirthday, context),
        ],
      ),
    );
  }
}

Widget buildImageSelection(String name) {
  return GestureDetector(
    onTap: () {
      // Add your logic for image selection here
      print('Image selected!');
    },
    child: Align(
      alignment:Alignment.center,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Avatar.circle(
            onTapAvatar: () {
            printToast("test");
          },
            radius: 35,
            text: name,
            backgroundColor:Colors.grey,
            randomGradient: false, //true
            randomColor: false, //false
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

        ],
      ),
    )
  );
}

Widget buildField(
    String title, String hintText, TextEditingController controller, Function(String) onFieldChanged) {
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