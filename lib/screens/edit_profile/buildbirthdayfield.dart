import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildBirthdayField2(TextEditingController controller) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.datetime,
    decoration: InputDecoration(
      labelText: 'Birthday',
      hintText: 'Enter your birthday',
      prefixIcon: Icon(Icons.calendar_today),
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return 'Please enter your birthday';
      }
      // Additional validation logic can be added here if needed
      return null;
    },
  );
}