import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget buildPhoneNumber(String phoneNumber, Function(String) onSpecialRequestChanged) {

  TextEditingController phoneController = TextEditingController(text: phoneNumber);

  return Padding(
    padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Phone Number"),
        SizedBox(height: 10),
        Row(
          children: [
            Text("+60",
                style: TextStyle(fontSize: 12)
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: phoneController,
                onChanged: onSpecialRequestChanged,
                style: TextStyle(fontSize: 12, color: Colors.blue),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  // Add any additional formatters if needed
                ],
                //maxLength: 11,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: 'Eg. 0193446789',
                  hintStyle: TextStyle(fontSize: 10),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


// Widget buildPhoneNumber0(Function(String) onSpecialRequestChanged) {
//   String phoneNumber = '';
//   return Padding(
//     padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
//     child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("Phone Number"),
//           SizedBox(height: 10),
//           TextField(
//             onChanged: onSpecialRequestChanged,
//             style: TextStyle(
//                 fontSize: 12,
//                 color:Colors.blue
//             ),
//             keyboardType: TextInputType.number, //phone, number
//             inputFormatters: [
//               FilteringTextInputFormatter.digitsOnly,
//               // Add any additional formatters if needed
//             ],
//             maxLength: 11,
//             decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                 ),
//                 hintText: 'Eg. 60193446789',
//                 hintStyle: TextStyle(fontSize: 10) // Temporary placeholder text
//             ),
//           )
//         ]
//     ),
//   );
// }