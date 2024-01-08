import 'package:flutter/material.dart';

class BirthdayField extends StatelessWidget {
  final DateTime initialDate;
  final Function(DateTime) onDateChanged;

  BirthdayField({required this.initialDate, required this.onDateChanged});

  @override
  Widget build(BuildContext context) {
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
            _selectDate(context);
          },
          child: InputDecorator(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              hintText: 'Select Date',
              hintStyle: TextStyle(fontSize: 10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDate(initialDate),
                  style: TextStyle(fontSize: 12, color: Colors.blue),
                ),
                Icon(Icons.calendar_today, color: Colors.blue),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != initialDate) {
      onDateChanged(picked);
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}

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
                // Align(
                //   alignment: Alignment.topCenter,
                //   child: Icon(Icons.calendar_today, color: Colors.blue,),
                // ),
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
  );

  if (picked != null && picked != initialDate) {
    onDateChanged(picked);
  }
}