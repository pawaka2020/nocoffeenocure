import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildLanguageSelection(List<String> languages, String selectedLanguage,
    void Function(String? value) changeLanguage)
{
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Language',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      //SizedBox(width: 8),
      // DropdownButtonHideUnderline(
      //   child: DropdownButton2<String>(
      //     isExpanded: true,
      //     items: languages
      //         .map((String item) => DropdownMenuItem<String>(
      //       value: item,
      //       child: Text(
      //         item,
      //         style: const TextStyle(
      //           fontStyle: FontStyle.italic,
      //           fontSize: 16,
      //         ),
      //       ),
      //     ))
      //         .toList(),
      //     value: selectedLanguage,
      //     onChanged: (String? value) {
      //       // setState(() {
      //       //   selectedLanguage = value!;
      //       // });
      //       changeLanguage(value);
      //     },
      //     buttonStyleData: const ButtonStyleData(
      //       padding: EdgeInsets.symmetric(horizontal: 16),
      //       height: 40,
      //       width: 140,
      //     ),
      //     menuItemStyleData: const MenuItemStyleData(
      //       height: 40,
      //     ),
      //   ),
      // ),
      // DropdownButton<String>(
      //   value: selectedLanguage,
      //   icon: Icon(Icons.arrow_downward),
      //   iconSize: 24,
      //   elevation: 16,
      //   style: TextStyle(
      //     color: Colors.black,
      //     fontSize: 16,
      //     fontFamily: 'Orbitron'
      //   ),
      //   onChanged: (String? value) {
      //     changeLanguage(value);
      //   },
      //   items: languages
      //       .map<DropdownMenuItem<String>>((String value) {
      //     return DropdownMenuItem<String>(
      //       value: value,
      //       child: Text(value),
      //     );
      //   }).toList(),
      // ),
      PopupMenuButton<String>(
        onSelected: (String value) {
          changeLanguage(value);
        },
        itemBuilder: (BuildContext context) {
          return languages.map((String value) {
            return PopupMenuItem<String>(
              value: value,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding to the menu items
                child: Text(value),
              ),
            );
          }).toList();
        },
        child: Padding(
          padding: EdgeInsets.only(right: 16.0), // Add padding to the right of the button
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 110),
              Text(
                selectedLanguage,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                size: 18,
                Icons.arrow_downward,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

