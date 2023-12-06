import 'package:flutter/material.dart';

Widget buildSpecialRequest(Function(String) onSpecialRequestChanged) {
  return Padding(
    padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
    child: Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Special Requests",
            style: TextStyle(
            ),
          ),
        ),
        SizedBox(height: 5),
        TextField(
          onChanged: onSpecialRequestChanged,
          style: TextStyle(
              fontSize: 12,
              color:Colors.blue
          ),
          maxLength: 20,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              hintText: 'E.g. I need more ice.',
              hintStyle: TextStyle(fontSize: 10) // Temporary placeholder text
          ),
        )
        // You can display 'specialRequest' here.
      ],
    ),
  );
}