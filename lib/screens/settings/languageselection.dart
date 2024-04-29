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

