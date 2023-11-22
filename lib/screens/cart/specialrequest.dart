import 'package:flutter/material.dart';

class SpecialRequest extends StatelessWidget {

  final Function(String) onSpecialRequestChanged;

  SpecialRequest(this.onSpecialRequestChanged);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Special requests",
              style: TextStyle(
                //fontSize: 14,
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
}