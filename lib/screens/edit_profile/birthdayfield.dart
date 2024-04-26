import 'package:flutter/material.dart';

import '../../common.dart';

String _formatDate(DateTime date) {
  return "${date.day}/${date.month}/${date.year}";
}

Widget buildBirthdayField(DateTime initialDate, Function(DateTime) onDateChanged, BuildContext context,) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Birthday',
        style: TextStyle(),
      ),
      SizedBox(height: 5),
      InkWell(
        onTap: () {
          _selectDate(context, initialDate, onDateChanged);
        },
        child: SizedBox(
          height: 55.0,
          child: InputDecorator(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              hintText: 'Select Date',
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 10
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  _formatDate(initialDate),
                  style: TextStyle(fontSize: 12, color: Colors.blue),
                ),
              ],
            ),
          ),
        )
      )
    ],
  );
}

Future<void> _selectDate(BuildContext context, DateTime initialDate, Function(DateTime) onDateChanged,) async {
  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
    initialDatePickerMode: DatePickerMode.year,
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(
            primary: Colors.orange, // Day text color
            onPrimary: Colors.white, // Day text color when selected
          ),
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        ),
        child: child!,
      );
    },
  ).then((value){
    onDateChanged(value!);
  });
}