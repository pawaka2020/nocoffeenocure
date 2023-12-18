import 'package:flutter/material.dart';

Widget buildSpecialRequest(String _specialRequest, Function(String) onSpecialRequestChanged) {
  TextEditingController _textEditingController = TextEditingController(text: _specialRequest);
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
        ), //text
        SizedBox(height: 5), //spacing
        TextField(
          controller: _textEditingController,
          onChanged: onSpecialRequestChanged,
          style: TextStyle(
              fontSize: 12,
              color:Colors.blue
          ),
          maxLength: 30,
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