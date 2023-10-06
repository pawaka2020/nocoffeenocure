import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Expanded placeholderBlock(String text, Color backgroundColor, int flex) {
  return Expanded(
    flex: flex,
    child: Container(
      color: backgroundColor, // Customize the background color
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24.0, // Customize the text size
            color: Colors.white, // Customize the text color
          ),
        ),
      ),
    ),
  );
}