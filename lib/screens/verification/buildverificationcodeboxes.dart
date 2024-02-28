

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common.dart';

Widget buildVerificationCodeBoxes(BuildContext context, void Function(String) setEnteredCode) {
  // Declare a list to hold the values for each text field
  List<String> codeValues = List.filled(4, '');

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: List.generate(
      4,
          (index) => SizedBox(
        width: 60,
        height: 60,
        child: TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            codeValues[index] = value;
            setEnteredCode(codeValues.join());

            if (value.length == 1 && index < 3) {
              FocusScope.of(context).nextFocus();
            }
            else if (value.length == 0 && index > 0) {
              FocusScope.of(context).previousFocus();
            }
          },
        ),
      ),
    ),
  );
}
